Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9E2606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bYKULobd;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=h5X2+Mh7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l2bEp5N3wkDM5hvlXu/q4Wh+Pcm/FLJu3KnOMv2gYeU=; b=bYKULobd42LCwD
	21FSW5yBtnnPf2kos87Peuvn8eep5MYdWxF5bb+bOLxWregzjfOimnGm2mC2tFTBI2jVSsrOPfdqO
	WZ01gqXqenfG/3VfwYjFhE/pb82zTtYzElsIPV+ifQ4gk6a7me7XqtKSMA18VpLPDLYN/p85yZh8S
	iRO8s59m88LMkhSq/kuVxYMSg5sny9bO0cCJ6VMofjR+wVkt4/LPeh7lt1ZVcc2snxAtMcjzClxgN
	jQJen2EqXrybSGNKbYn6o/l8BSozMcnyhBRsZ2KlZDQ09FF5R5WeGY1TygFErrbLievZiZWdGtERH
	KnZ/xg9Nt4Nu5Phqd+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOufI-00000008SD2-2ebr;
	Thu, 05 Nov 2026 10:25:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOufE-00000008SBP-1Eft
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:25:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2eb0f1b592bso6037105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793874347; x=1794479147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2bEp5N3wkDM5hvlXu/q4Wh+Pcm/FLJu3KnOMv2gYeU=;
        b=h5X2+Mh7zQyVikFq2hPO3/0gJAmp1+ghWFwf+DsS7PugpZfXhqRmKLlQ0zvMBamoOh
         6TU/xANmP2Xs1SkujYltH1eRreZ7f4UplgHItnl8pP6FJKUsOOGt1mL9HjbWTM4S9jOv
         1dlX64U/lvJkp0fssfysCpV3yOPPqIhsH+Z3UNFH4gdVyqRKi3kNfQWdSzDta+/ot5NJ
         8vkPymWFF8KaD9TO+Bij0yYgDEacqu2BJlcuUZySm9Q2SMNvYy1Y5klYefL6zqvXL6W7
         /nmupi+zfHVCfYZLd1iAJ7NOPljaYnP0cxlBXglvwkyOFygD0XSgOTfSdIB7s4FF9jJF
         qJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874347; x=1794479147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2bEp5N3wkDM5hvlXu/q4Wh+Pcm/FLJu3KnOMv2gYeU=;
        b=K36EQkV3TOnj8MORyjE4tNggGGBY1Ru//tQoAPwDiDqV4yyGxmc2wTSQszxy+u7vZi
         xO85FuxMMdl1VS8vjgCCGOa296z9hmWj1ka/0d6I6vaieLgtdDri5EO9nn45ErxaOWrJ
         p6bRTzGrIx9XxDaWlK0XL8gZC6hsAK2mP4XN6aNWE38V71EuGFlhUN6eDkYILkvErUN+
         G8dLldV4vgxXgnNJPwL2AvCj2lG8IT5sg1+v5xsnzIhPWay9pl7rcnW4b4zoIDdMWL1w
         0ejeb+pim+oMwhv9zALiAeVdVzd+TQEs8G39NVY4eoJ+JQtYZOBIAPWPV1mX4ZTSZc6y
         Ez+w==
X-Forwarded-Encrypted: i=1; AKwUvByTkAdtUU6h0glTlRF861sM4YpzA7k71pr341pyiZjpq82z+sdOnlL4QAQX8aU+UX4QQskFM6Qx7TF52RqS6xBM@lists.infradead.org
X-Gm-Message-State: APuU4Z+ROlebp5H1/AxB4d7JQvl7jl9sSmGXwZr81lM0KEQn90RTAmbF
	2/dPURiqo+/W3h7iC8gCHaPeHVSyCfmMLDm/OcOOzeErxx7v8SBPXHW0WImVP+lZIQ==
X-Gm-Gg: AYBFou2LELyWR/IKryzZMp5l2QIIZupm61Te3Vpyz5YPlV/2EzN1D2/OHX9P5AZb7OG
	6JuOWdB9U/SO/JuJZQx6pyfddovYRqgi1zIm0GUVfAqHs/sKHOG6YGbINwgCRjtnKSSxplbNlM6
	pBZsZcLmgcQPPYo0N65NECRelTXOiuplKZ0lO+R2tdy7tladh6vykHvIv5SM5DUoEqJsFuEgyhO
	W0CBMAdGS1xKlewhtWnoXC2VlaiOZL4uv5wCYawYEwGad3/FkE/lQkmmUny2zSpsDv47Vj6fjPO
	MMybEY2oYHcJCIPBsXdBxZP6BQYh9cEK+goUWb7viSUjGOjAixwzD1i6ueO4gCe+dJgt/hitm2T
	tfDC+WFlStpdEh3/VBuaFxRxD99XdP4j2ZHW1TdoznGYXIw0Ln9uRpm/QnNtNwG+C/l2o7z9Q9O
	ITJCSCpTolObU1K1bduE+8eItvKVtiH3KANxTiUU+3fcOH2KsGC0Mym/bKOhg7GgeoalhwfA8ju
	oUmLgUorxTAi/yKIhtqhIMVDqZey+AkVLYaUUHNw4cjCdlHSHcUlXwVyRG9Fh18vL8wwKD84Jfa
	AwLptgjd3l7PMXJhz9qEDMazMfMw7Dtca9gu0GrpQKmnQxo125dYW0KP9S6X31E2q0ymbyHNXPC
	vd+gEkctq7lu/pksSRb4=
X-Received: by 2002:a17:902:dace:b0:2e5:78b1:33fc with SMTP id d9443c01a7336-2eb364835bdmr184698585ad.53.1793874346953;
        Thu, 05 Nov 2026 02:25:46 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed09127cbfsm16133795ad.50.2026.11.05.02.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:25:46 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: ptp: fix support for PTP_EXTTS_REQUEST2 ioctl
Date: Thu,  5 Nov 2026 17:25:40 +0700
Message-ID: <20261105102540.2273912-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179387332308.488856.2315265262072517836@kernel.org>
References: <20261104052504.1886335-1-jjc@jclark.com> <179387332308.488856.2315265262072517836@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_022548_598495_4B952DAA 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026 10:08:43 +0000, netdev-bot+sashiko@kernel.org wrote:
> The commit message says:
>
>     Only the PTP_EXTTS_REQUEST ioctl still works.
>
> That suggests v1 behaviour is unchanged. Could the commit message
> describe the v1 change explicitly, since the patch is tagged for stable?

Sashiko made the same point on the equivalent am65-cpts fix, which was
applied unchanged as e3aaeebbef56. My reply there applies here too:

https://lore.kernel.org/all/20261022035226.1388675-1-jjc@jclark.com/

