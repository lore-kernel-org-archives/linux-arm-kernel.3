Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00100606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LK8nY0/p;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kD/7pys7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I+Qa5WVKuYcYfU/y4Py3JcPSgphTXRd4H3DrDRK59fA=; b=LK8nY0/p3tE1OT
	O0XUAMMVZgOZqYyrAEhFFy/RaX1CM/IXPBVD6M0Z3TriNO6NW/O6D5XMH7b6fcRgoBp1DrnCtnc7l
	iV9suXCMCZytoxyrwTQJhKt9Zyzc5Qc8Y1Aaq2lUYxR0nhxnrHygP0wPsLIw+Q12P+H0WeQHAzmhr
	Hf1TJeMWMzA9XKTX80Svd18cIVCKFtuEXymirmTFzvm/FnXQzddJ73rFJJ/aNzySsgok6NePcaGHz
	oN8eUX9EpnoxcuVfOXABLZ0OyuNm+n+quCD709IBJ38qt+x/kjAPf9cOh5DG4GgwfDC2Qi1CdqgOf
	c6sZGfiGYqtBavVn87EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcK0-000000040e5-1MId;
	Tue, 27 Oct 2026 08:14:16 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcJx-000000040bW-262d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:14:14 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so421973a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 01:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088852; x=1793693652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+Qa5WVKuYcYfU/y4Py3JcPSgphTXRd4H3DrDRK59fA=;
        b=kD/7pys7Vancu4rj1KzUSgrjd/R5C6M52f8ZQM4PuQD4L+jl0036YElcWh835jkEsb
         slXiEkIIbBo/PbZViasJpx81kUTqzhgGurvmsqWGUUCI9OggIJvcXQQpVUGZ84ugTXfq
         0wMBY4zcSzws4HKjGNF9K3IxJ9Un6+O7mDMyoAjBtBdY+M30D30/0mDxBnVDPhTw7tl3
         Blftvi582ersZ2jEFUxz8/Z1uH1vQ3i6WLaFGpQ+7xE72RjGotfsMyEluA4xgbJLKQ2y
         hHmc/ghxVbqwLynqH4Cb5c1At53Q6P8VdSYxbsf8HRMc8SsM7u9xpqOe9vnpD9z++0Vv
         gUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088852; x=1793693652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+Qa5WVKuYcYfU/y4Py3JcPSgphTXRd4H3DrDRK59fA=;
        b=KgeZX9gkhVYVjwvb4dH6BaY8MCNEfATADNX7a88FOBX2F2SexLu3+TdeiyAOKckXSf
         JyYyRvB+1umTk8DuFO545ExH0yAEysS+8ZXxgBb0CQAmiK2YZZRSN+ew4gpVhjVz30Ae
         jYHUEzUkloiPE289SnK80sSfc1Ze2CNDVClzUHT8/IMOlszsc/3Iu6kjooJelqwzpTmF
         SZ93dwT4Hrhm2mEu6w9ejKP5Z9wjHfybKCYg1cEpmIpvqmNCgetAt4livoIVk+59yXE8
         +bbRaTsJwp5CiUsDbsi7acJiKoywHOYT0rSR58rSYt44wKhwPtn3YyuwIccRVV3VGAXR
         CUqA==
X-Forwarded-Encrypted: i=1; AKwUvBwKuWI6Y6WHw0eSFkyN2jztt2YoKG493TidbqjbK9U+R79TfPPx6y39lxMUk79QoQAnkHyWukSsP0VKkVNPzg8f@lists.infradead.org
X-Gm-Message-State: AFq9FYIPFRWF5e0a6uIm5fVX3fNgS37n/7l2tLYtDQgwCwf49r9QZf1U
	MaSudOB885D7dqvGQfqOcOqC1SN48JCcQjBCa5z6ElVMS1TZSpUpyHJI
X-Gm-Gg: AYBFou2yVMSEjHH5bwZnc+JA1aNMbTs333vnzl6mMllRB2cY1u7cGwuM6MHIPQLEAwN
	4bBqAn+00dLvI4E6rI3Q7WCwzGiWyZBhhQnGByNDzUO11yxZX+RT9y4tCw+7Sg4meRgPO56LSLP
	wUStPSEV/RMDpzhYU38EqP5GYLj/Tc4sHIl+bVjpAzX604l1IvfhGYnQC5WMVm3S1nze+DXrGuB
	gem1F+uOPgBAM93fUSuH8IyfNW/KIQiFKqgSDTEYM9ZalDA1pmEQ6vNGd4OH9mRp8kaZTntCSmp
	TSA7U1YtUZ5PTfPQZrBEX+82HABiWzgqK3g5Il5zGLBEZ47/ggg9i0rtSNECCkjVshDn+StYBZ1
	j+1zJqxGPG8vhrCFlJUKnvN9ob+vz/pj3fD24WGlv7PlUagF63JzP4GFLw87oO6tuQT/BSBifqw
	/YWhENIT7CbQAyKKxpDch56WxMuZY7ANss87c3F0D1BkVZJDpAmHS1IMZIeyrIZ6dPJr2JMIVZv
	sMOZciexyX4Oa5wy2AMcnpIMlKXNcD3yZZjplJ/hlnZDF0mPzNIPdFaEQ9YjA==
X-Received: by 2002:a17:90a:da83:b0:3a0:295e:6e61 with SMTP id 98e67ed59e1d1-3ae402840d8mr910495a91.12.1793088852151;
        Tue, 27 Oct 2026 01:14:12 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeb82761esm7465990a91.0.2026.10.27.01.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:14:09 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Reject ris_idx == MPAM_MSC_MAX_NUM_RIS
Date: Tue, 27 Oct 2026 16:14:04 +0800
Message-Id: <20261027081404.5822-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c5afae4a-c8cc-481c-8c98-8a0f84db1911@arm.com>
References: <c5afae4a-c8cc-481c-8c98-8a0f84db1911@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_011413_550713_BBFCDB49 
X-CRM114-Status: UNSURE (   6.96  )
X-CRM114-Notice: Please train this message.
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

Hi Ben,

Thanks for letting me know - glad the bug is being fixed either way!

Ping

