Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E2B606D828
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eQp7NcNw;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X15zPau3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aD8+I+UZp21WBX5+us8nW9tJ7k4pcmrSW1MwYtrq6n8=; b=eQp7NcNwHu+2B+
	nj3rCouNe3kTwzw8gvrmTbvAfOsPtcvWwLRWPOkfVoh32HCL/bleOBPkahonRx3xZm5Rfkt4OTr89
	MbVCfPU0Y7WIW81tSBR3enni4ldDD/XleVQOos4fnEdpgv7EOi23WMiechP7CZc00Ltc794wDzyyA
	GvA2kbsx5tFAnrzLYCl7lCNE25AmqUSvibwM5BYut6hD8lukVVt6n0sMmXoHe3yLUPuD/4FJD4T+U
	U64Kw5w68nTXP++x9iLJDR3MA/WM8Odv+HidjCvxdXUxwV3+yeDDOH0qz/1DYw3wXTRPqGtM6MMvr
	RAluxIDGTvHJ399BqA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGwb-0000000BsDh-1Bsw;
	Fri, 06 Nov 2026 10:13:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGwY-0000000BsCC-3fij
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:13:12 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-492690dd5daso314892f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 02:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793959989; x=1794564789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aD8+I+UZp21WBX5+us8nW9tJ7k4pcmrSW1MwYtrq6n8=;
        b=X15zPau3FD2OjZHOkXLTJCENP06qaC3VT3T9avCVdcDlViwQ9ey1NoKjJJYuvGsjyz
         DqMNx0qXKeZox5NTyfFonr9JfRGsnO96HeDaBaPdq5toQYEY1mmfQ/GPvfCd8EcKjzGP
         K6OEt4SdGp5aG+dGXIVNmtsR2T47W+DH1gcO8MOeHsyJLtuBlnS+hLmNk+SaIDZsDCI3
         LscgYjKI6rhkK1GCuwMr03wUrZf0FUEOXmOA7iyufqtxL+xgwArgp9WFvHvbYzMCYLqw
         zxI7+JNsT034MfU25oAgyfdgFQrzBuS7NZyo/Jt2+X0W6DzgncTVyXKUYvO5BUmVs2EA
         RwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959989; x=1794564789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aD8+I+UZp21WBX5+us8nW9tJ7k4pcmrSW1MwYtrq6n8=;
        b=xiBF+Z3/2lFGJNi3XfUZ//pNyHi6q5KeW9S9JnnSL6w7zwDaw6Ah7zR5A2lhXTl0Fu
         wLKPpHnONSTLYHREsmiCl4+c6YkP2cq644lWh6j49/K1l3rWy+ZlxaiYk50zZ2O5oIBg
         257bZ/8mjtrCdrdWTcxI2pjVHMngM7W/cPuGTAyKPoFQRGjGPbOjPT25o0RZiPsTpo+c
         nRzJI/yOQC3CaYIVV44WB2t/tBHBAaEHt3kiXhOkbLK64mXgYfAhD4BYWnAWnBhUekuz
         isxD9N7tUrrdo3VP0MDSaUn7wusGn2drpETyLJ407915niSTSrxJ9TnRgSc2Gk+6e2aW
         OpLA==
X-Gm-Message-State: APuU4Z+8uVn67ukzrOHSW+PU2VyGfA4HZ22taa/B7wnxeBBT87LnvFXK
	1Uvj+6M5QU2pe4sUhUTwdtbX23W3Ocv9CMUDxOfZ3Ck0T414ZiU+qinArrgOiEuz
X-Gm-Gg: AYBFou0iBJrid6ugn3tBNkRRkB4QEFN50i8gKbY5EeBOv7nTmNcSJ8BOjIMRTCky+WZ
	hDmMVYa6KmUTslepYFkF9U3zJEgNyVbRaN23SjiimAJtrtcElMTkPG2bPn2La6oqft9PMCxbtpW
	FnGiTk3vcwmnavF1d7l6JSOvbMCtjkOwG7EwAM5gMMkWH12oSqb49loCSokfVOp44n8r5HcVL7m
	u68BSdIr1ivIwEOHL6+t+TUUKKxeKLkndMp7IRJikO0gyECk2o6GJ3sNZP5cpU+Itqec/fk65eF
	1Cj98wkOY56wMpJFXa41U+5MHG2qutvUzZLSIsPSalUK+AYP2cwMhbIy56aVFhb8FfzvfL1Jf3G
	UkyIMPjoUHdHFHl2rArDrwmP7KaDDgYdm74UddE3x88jiBgqvKg+2B+dXCuVv82wwsZWvW2EHhI
	0BmgYQ1SebbqueaQSh2atFr+fi4LkN3euLa7WyilZQ32bzb4jGx/qulP6OHMDKwlK/mxu7KPKCE
	ghJ6ZnUl8zbbSzSO6AR3XAUAc2qr9ByaBXLK2LqEyYFLkEyUJ1n6V0Etk5d3JbMD/pGjZfSTLnB
	gSTFQvsUB4WskGJW2Yg/K3fpTYoeNJiTZ4h/kKQQv034MOxCedYeHZuq
X-Received: by 2002:a05:6000:27d0:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-49276d4d926mr3096819f8f.32.1793959988755;
        Fri, 06 Nov 2026 02:13:08 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723310fsm2934846f8f.32.2026.11.06.02.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:13:08 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Date: Fri,  6 Nov 2026 11:13:06 +0100
Message-Id: <20261106101307.3936492-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261014072109.1759502-25-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-25-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021310_929683_6AD18C6A 
X-CRM114-Status: GOOD (  12.32  )
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

Hi Navid,

On Wed, Oct 14, 2026 at 08:21:04AM +0100, Navid Ghahremani wrote:
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x40000000 0x20000000>;
> +	};

My unit has 256 MiB. It boots anyway because with
CONFIG_ARM_ATAG_DTB_COMPAT the ATAG_MEM from U-Boot overrides this
node, but without it the kernel takes 512 MiB at face value: the
upper half aliases the lower one (0x50100000 reads back what is at
0x40100000), CMA lands at 0x59800000, and it oopses in refill_objects
once ~300 MB are in use. pp@5da00000 is then outside RAM as well; the
vendor kernel reserves the top 64 MiB, i.e. 0x4c000000 on 256 MiB.
Does your unit really have 512 MiB? If both sizes exist, maybe leave
the size to the boot loader or use the smaller one.

> +					macaddr_tag_1e: macaddr@1e {
> +						compatible = "mac-base";
> +						reg = <0x1e 0x6>;
> +						#nvmem-cell-cells = <1>;
> +					};

As far as I can see nothing in mainline implements the cell index for
"mac-base" here, so all five ports get the same address
(f4:f6:47:0f:42:64 on mine, wan included). The tag partition also
stores the WAN address as its own record at offset 0x36 (..:42:65 on
my unit), so a plain second cell works without mac-base:

	macaddr_tag_36: macaddr@36 {
		reg = <0x36 0x6>;
	};

Agustin

