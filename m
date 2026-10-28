Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F04606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 18:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yYULDbut;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C53cseBN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ybFEGW2GkaWDNkvmGtInbPjCWSjYZVjZCwJm5I2kFxM=; b=yYULDbutefxVOl
	Y9AeO1+OZIjqc6AWxd/Y0+AcyimuwZ0xM3J+3j2Loe7k5oCnk6Onzx0CDZPQda7LtPNFO/ctDvQ78
	M0VECjAchZIMRj5raETyS0657Ha6rJCgoF4zT1GvOMTACChlgYaeG2WBoEf7RbmOoKR6hSHA9nwhH
	Tmqk5Daj8cA4K6VVa3gRmELS3URnYpMz+0RPKFYAx2yXeibpol70giHXM/bqnP9PS5es349TTaR1E
	NX17UZvq8jtXmadRYN0YX9nPZw4kS9KlLFa28uPKx3btHieEqdjnOtL2DHUyC/rRlR+dS2zcfSFTC
	RvdrlkFDDyCvAQS12jWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM85o-00000007jF8-2OAN;
	Wed, 28 Oct 2026 18:09:44 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM85l-00000007jEP-3POo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 18:09:42 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-5eaf34452a9so965475e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793210980; x=1793815780; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ybFEGW2GkaWDNkvmGtInbPjCWSjYZVjZCwJm5I2kFxM=;
        b=C53cseBNf/mQUzpXQ5Iy+nbCOuxBXhHMUZi4q56PtZIXrGVEi8lWkwkD2H6T+P13Xp
         Tpp+jXTttAfWxYsEeT/P51jNqaqJAS53baFimBRZx9cy/r4fXPnDcyeJHnIY5ChJ1MW2
         PZ2BJyLm+ljwjXDeEV8reilRtmamyl6UjJKzvOa8SSnXMlwYm81gAFHX4TZQoyAKXB42
         d2UnLIPVse98woq9vegWb6lTnfaq0P8xelcdxAqRs/7AOs1AqwNrUXWjKCS/DsORkpK3
         rwQVH1gHlMmRYV+x278kSuBkouimMBKVMKqtPD+u3vbd3XrgC2kzGM2VgDm9KXr51UqF
         Z7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210980; x=1793815780;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybFEGW2GkaWDNkvmGtInbPjCWSjYZVjZCwJm5I2kFxM=;
        b=m+hIIt1HmfuY1MNat3OQKUnZqLT4QjWdpjf3+CgXi1CMRS+lnXTkWQ9qYVPpZZT7PS
         ZbIiv5Qn4Ih6mcDsLghxtXVyvFVK5kXy4fuxAUjH8aGBn0JdGy2e8jjDuZPFXH+D9ktq
         e5MMwrAJe6UYuw/9fiHMNE260FNG/gJuMx9MG05L0KWbgFJ8IfdNvqC+Gx9saw+DAvRI
         0MJ76mAjwBRqhrPBGqX8B2n+0RhGSb3l3h/gatVbd8W1mg7PkoDxjTPBmVhGpdxrc0C4
         Hr8FF0JM/wh9n6RsVBZPHX1QoeYgS5WRALS7BIflViQ44eYdBMCB/Yg1UpnZFdPtHOGj
         phLA==
X-Forwarded-Encrypted: i=1; AKwUvBy2bbyE+whE9sm8bI93XO7ub56w2rCxBCwUIwFn/OoN7Ey0uORBLm/Pl915YrdN1C8+dLFAJbtc5sgyqfrPU5au@lists.infradead.org
X-Gm-Message-State: AFq9FYKiWdWDuyaoWKFQGmPBUeG/KnOfI1pJXkb5e89x0FEOfxxEdDof
	wZ0ZKKag90Em9jqKYHvTzjVCD02Ft8rIUHvTYoG5JNrTAECEIKLnH1hH
X-Gm-Gg: AYBFou3fp3aB7EqU7WfWz+a/oPZAORN4p0CZ5ot21Rrh0foMzOyYEBqb6JQN9iB4f6l
	Y/vhQTU8OERaRghC5GxekZn4ck9gfq3R4fqnaZwbVdmM6JpH5CSyEyW0Khv5aT+7EtrzKC5WOc5
	NVaeyg1QUQvIlm97la7KWxvMJXD214DeBdJKAm9oJOg1rCB4fqT8MOVSMowCs3UjE2Olx5Nr1qz
	551QpNyUUHyribZm8rUATC1mIoG+D2p04kkT2yLVsL90NK8MMZDQ2T642+Nccg6thnYPElcq3d0
	IfKfiAGIoaM09HnU9Ue7TbCxgh925AgM7I8/pDKCTUaQZmQBAtXB/eN+zGLBsqJvTETc5urJ5fm
	i3c0Y/s/suYO2FwLzxtGcwSjGeEc3P4Tlmdm5pKZqnZhIQNIZRknZdi6/JOkCCZqNRQC9oZJfos
	KeuJMRrMI0iFPAPgCdx1JCOtEIsTrUKCki950nZnl1WJNZiLZuNmtVEmB8iu2ohNBy4TvNdkGyl
	oRywh/gAnvPDNrJAAMPnONVUTPAV1ntJxPFq7x6QEU0tJVtuS8l3adXlgr708KgSmtyOd3M99+x
	1kMzcT2tYVKwK76Lc2loRpHTAKzQ20K6BjgevIj33DoWSEXIs4LrHvHE7TrH6UUQ2dLpPiKz3l0
	6BGRqGG8etyBYeLlApcTlFRg8jormEIhhC2p9
X-Received: by 2002:a05:6122:2652:b0:5ec:2394:fdc5 with SMTP id 71dfb90a1353d-5ec587d8fa4mr78307e0c.20.1793210979685;
        Wed, 28 Oct 2026 11:09:39 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f93a492sm2588887e0c.11.2026.10.28.11.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:09:39 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
Date: Wed, 28 Oct 2026 15:09:13 -0300
Message-ID: <20261028180913.2829389-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_110941_859333_80B7915B 
X-CRM114-Status: GOOD (  11.03  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Junhui,

In patch 6/8, usb2-u2-ref is declared as a plain mux, but the manual
has a gate at bit 31 of 0x1348, and its reset value is 0. So the CCU
driver can't enable it.

-static SUNXI_CCU_MUX_DATA(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents, 0x1348, 24, 3, 0);
+static SUNXI_CCU_MUX_DATA_WITH_GATE(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents,
+                                    0x1348, 24, 3, BIT(31), 0);

I hit this on my Cubie A7Z with a USB stick on the DWC3 port (the DT
and the USB2 PHY driver for that port are local, not posted):

- v6 as posted: 0x02003348 stays 0 and the DWC3 soft reset times out
  (-110), 4/4 boots, one of them cold.
- same kernel, only bit 31 set from U-Boot: the host works, 3/3.
- with the change above: works, 3/3.

Same DTB and initramfs in every run. The SerDes gates were also the
same, so I haven't checked whether they matter on their own.

My boot chain (U-Boot SPL, TF-A, U-Boot) leaves bit 31 clear. I don't
know what the vendor one does.

Thanks,
Vinicius

