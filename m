Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42460606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BwhQFquf;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QHnCCBKs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s3FlG17r0XFRuydckmuTT5yPIYEc0FuY2CChe1Jf4cQ=; b=BwhQFqufGx0qRk
	Q/fCQpuQWQMiPeau+/z1DGGRB2S4QqiN2aoDroxuZ9CNQSz+8nAOMLBBlHKNaEChBbTDnWehkqaQS
	MR/Urg8635O/iyztdTAEmCV1fjFGck+DT4T/3VwvUjn50J8Sbl5w+psqN1p7pPd7uouq0uCABsd4N
	/zjkajVxSTiJR9F60RLIlkCc/VCtK7KhPXENySAFCbfRsnsijlNgEskFtclBJp7NSI/cuzF0NqA8U
	nQEErElNg14QlppZKtnt1bK8U5nLosfvzyg4JjM8jHbdn6i3eIC4EAQClbPTrWoUHT+ShdZ/UXomn
	ZxkPUt7WIIF3Cyk8CXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNXjJ-0000000Edbv-3xFm;
	Sun, 01 Nov 2026 15:44:21 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNXjI-0000000EdbA-0hib
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 15:44:21 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2852386a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 07:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547859; x=1794152659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3FlG17r0XFRuydckmuTT5yPIYEc0FuY2CChe1Jf4cQ=;
        b=QHnCCBKs9RVzkVBy7JvbKQfPlkkXRvIsiJj5a1FvBlFCQJIJz1Aq5A8vagCzqsY+O8
         WWhsv+z2Tu9rPKdEV+wilxm/m54crz8mEwexVLP4KXQ+WWNuJm8jTZJCcP68sH1n+OWb
         IhLH2z749OlXViHOVAbF8Qa0gFF2ich0va2NcHRtJ8vihegIflYqxYid1MmIyZyJyuKj
         SZbbmvEBqBTqicKRfedBa7UbWUiDAoqLgrcv7iB09wq22lol4wlroOJ64tYvAMozg0uQ
         Mb2oGXwpt8bQ5qCakj2zy/ZCLlOTnnczZaIq9/+bVZjzVOHSM9wm/zc7gtvxkf9/YkoD
         BqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547859; x=1794152659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s3FlG17r0XFRuydckmuTT5yPIYEc0FuY2CChe1Jf4cQ=;
        b=xPIjrTNmxxdadrisEBFJj13D9ob20f60iazb1Cs/XfOWDA8RXgwSMe9g4hRfJaks70
         ziUNCsE2ZGNyLq3G9auu1C7b6Pckpk5JhBaJcfPkEe3cWL2BlcTfsjtDcIXRs2dxIr2Q
         vEVLA3t/QNkzv51ERV9umDzdygXTPM3W7q+PCmxkqy320uwIlAmONOYBZZ9m8WT5kHqD
         Tc1zn23bqgogLJLzBgPcWYXth6mOoT5uY8wMvahH8CyqRqFuTpONOkYc5sWZ1VDY1UKN
         EMvbfukk6M4bzHqId4Ee9XaAlLZPDhxhLrqXg15tYUJbWrIyihrxcKT+NfnArscWm49c
         LiCg==
X-Forwarded-Encrypted: i=1; AKwUvByAG33L//taFYQItinrW+VlSwAcrdOk0r8uk79lbH4Qw0XxSQiV8FEIdq0aIW+KL+yI445mvvKiPGISeyWvDkP6@lists.infradead.org
X-Gm-Message-State: APuU4Z/wcd2giblXfxdXDGTmJ3r0lZ4bnrsgGOPnAaNjLaWgqn7taZ1S
	16NPuFUY6XoeBvDsIPB/lpbnNBkK9BtqI/V74Vl+HcNahSPZgUKEe1Gl
X-Gm-Gg: AYBFou2fEuDW4/Ot7uKIoIB/qCDWF7WYN93eXSSL+Ipw6Zy67cEhOliWpDTMTZG2itV
	l90TJQ9SMZBgEDcMM2ZwVOktiM8gS0sKSt3SooiV/u240ujuaOs6Zrn5NpAJgzBPm3G5QTaBxDz
	p1gHOy3jHYPDDrm4VSyNyC8kEpj/ugV6YaBClyLXmSI9ImAHhu7aDRBggrz2HiCppotcJ5Rr4CO
	Zg7Uc9FAXuoPvsxoFLPnAzrqbrK2ojREIRpQONyjZqhXzkM/l3OPGPDwPrVtsBNtxkLU1FIUqAK
	ss4MAg9sZ9vogr233IMwyW5Sfq5pyN8Z441PWiXY6wUZHkfB3YZmo+hOjEhab/JdlPZFLOOxKZH
	evZ8FPUr3g0iJdRIU+gl4oF7oEEFFtR4ixTNooP9/GcOLawgVO35zG2PoVhpMOCyu4BL5O3Wlrh
	zBDw8CAMAoCY5lT6QfIrVsx9dDtOlMtDwJeUhGA20CslrvNCOnMkpmFSueCiogIHtCG4lbg1oiJ
	/VRRsbzpYGAdBFKKxo6mqyW5TEY07b20T8ghWpdvOtSHkjrNBFTgUuw+H0V5HQ3jP1aVDp5kLvS
	b7Cyf7tH8BMuwbtFOcQPRVvyQnN7Sw+lfVtGo5XiPQ==
X-Received: by 2002:a17:90a:c88c:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3ae8984cf7amr6490533a91.61.1793547859268;
        Sun, 01 Nov 2026 07:44:19 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm15058401a91.0.2026.11.01.07.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:44:18 -0800 (PST)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
Date: Sun,  1 Nov 2026 23:44:07 +0800
Message-ID: <20261101154407.3949-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260922055011.14972-1-yaozhonguwl@gmail.com>
References: <20260922055011.14972-1-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_074420_226563_9DE94ED2 
X-CRM114-Status: UNSURE (   7.60  )
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

Hi Heiko,

Gentle ping on this one. It still applies cleanly to current mainline.
Please let me know if you would like anything changed.

Thanks,
Yaozhong

