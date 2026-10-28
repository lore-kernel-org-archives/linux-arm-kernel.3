Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BF1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uvkqBXN2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EYxP0awh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RRuxTSHqwbMEC1Vyc99sUTotqRotw0K4rkvyEEzXBAY=; b=uvkqBXN2r2bJ9h
	We7unUXZSzEs7HfSnD3/ZtLy92AngnrCJPgjt1xtDUup6qeVKnAhYVNLK7dEj0EyHbCB6sTkPH4GI
	ycgB4js07Ab4wRvrdMWjwHvBhUXBUQyE2p94XzP564jzynEIS0n4j/S9Bt2Jrwq2ku8/GhTyIQLkW
	oTRLBEmy04JvB7+CnJDrMyjLtWE6z6iHFbDsZKiO+fmvQCSx3MplWvsy/QMmupTU7syYw9tFsWJKv
	6HH4WqwgetGLBvlWmwW27BKfo/aMSs/AFgDmi+MGalR9bgF68THA5bOtM1h7u5x7R9j4SRSyH+f2T
	ehn6QdytKJQvBOAt1j3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLyqy-00000006WWJ-0LU4;
	Wed, 28 Oct 2026 08:17:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLyqv-00000006WVz-2wp9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 08:17:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so5705585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793175463; x=1793780263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRuxTSHqwbMEC1Vyc99sUTotqRotw0K4rkvyEEzXBAY=;
        b=EYxP0awhPr9gOjBoOmJXvfPwXxRTpP17Tf4aQeTZjo+GXuJURbW2HBqbhw3n2axq9A
         EWUfc0dl8BJpIjTcWTBb+HXiM3bOhsrEDBNfyQCEsEk/5VFraVOT8L2+lO01zXlzTG4C
         CEEiYVbud29QLb83OZuPk3cjo6ojelHBr47XzhD3QudIYmRP0CE5+H2XYx7mPteEGRKP
         Ebm1lRojhHkXE6t4J1pQfiiCH8p/Iz4zAQUt1oYv16Mq7rLzuT4u4UPl/TCjXJkFPZk5
         DckmFmABZ9sONKOJkdhm6WmTIemdqcJyrkcg56Ykq2srLoQREXWEsA/skoZY8LdlWsGV
         l5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175463; x=1793780263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRuxTSHqwbMEC1Vyc99sUTotqRotw0K4rkvyEEzXBAY=;
        b=mFOPPyzHVJvIrAGvEwT3gQ8VnGYRqs7LZEMa6f1kP0e7SSCgbdy1It9CRrXoFsbyLv
         g42u0xlJAitkQTvpaPWNkiXQ8Xg3TpKXA6ZIhACgfJB2t+F+s/vBsgpYgotNsyInY6UJ
         hM97M6r9AXSqzC++bFSR3QQnqpJRR8fMc7oaj7vgihwUIpR2JIb9vh2NdIzGRQfh5NVb
         z59I7d3iW79XmtizVmOCiSUXs+HpLHQPCpz86HQfye7M4caFIqbw/vb56bY/slat5aaJ
         aAdYZ+hGd7jCXUuFucCURat0DLM1nK6De1dKBixcl2Jqto06xdSW0V3jykCg03X+fmgi
         P/Ng==
X-Forwarded-Encrypted: i=1; AKwUvBydrnmeQdEh1LlZdloCei9d/Myvu0rOtydcAeV1Ico+wDGXxbO7NyhpHhbKkxDQqk81sRM6tIuiOhdqPnlhLxr7@lists.infradead.org
X-Gm-Message-State: AFq9FYLttrltGVidDHo0rR2Op/gv1NdCt5r7CGKonljbbtF48sARGL8Y
	pJ2ugfk0MvNxOWva5trqdfZMG3m8xOPZ4msEP69OuLzbJsuWiWcyQ2NQ
X-Gm-Gg: AYBFou3bidtKft3V/uDjThTJXaHae4b5AOaXxnJ8gFZXDrglkkcPIlz9OlrJ8kyNbkQ
	j/2JbxOIkEIBpTmDpysUPKW3vpoZHKHgifLs9yS37TNg6OarzSx3bH8ft16IJpIGem3wSDts5gB
	7z2M6TybhsRYDdl/RZy2tp1etk61y+Y22opDvAXRPHFq3SUcApymWgZH15WlVvQkLI70MNrQCq0
	lm2E/UwMo0WPGiFSrxGajgrwGXHmTkGf+iAQO3ptXy/pgM56V8hKHjQLFfDrbqE2kuElRFGN2Wg
	Xv/m9itIC+D/mG3EQf7kAyRoaN6sLqwtRi6QRCdZ8tMUa6Y0/GtwwlnUOL18PFzjIvcpxb+VSQM
	4dxYtNZ/kNaGrPynOQy3DVFKVIwWf/PVcxz075ZcGXuZuH+cJcRtW8MQx90FX6TsIWrOJ2kDXOD
	Y630VFgNqMQgfqoNjIe5rOX60ORXPCBS3TnrG9dbVJtHo3T3Q0zGsXTPiJZEB46VFiDKk1cKIn0
	ET2bl4iuK9EuYIW/DsBNgAoMniBp2owPhAHW0hWUxSmfK3mu6KgNhFyLJVZEKYWecGOs1Svo5WH
	7X6bnkrmaOS322gz9qMvryKv95DMqRu2JmR6HZS6hqB6ZpA/dDMpCc973QlmwAD+0ongpIEe07L
	URIGdUiNHaNvxDac2H9UsugnV/d1VTonerEWndeQ+CcRQjSaRS7Jp6Xk5bOsWgzhsOXdJ7TP0a+
	WLsF1+8CWi6XHiTkbJlw==
X-Received: by 2002:a05:6000:24c8:b0:48b:ec8:b0d8 with SMTP id ffacd0b85a97d-48e5d5c3dd3mr4027197f8f.32.1793175463262;
        Wed, 28 Oct 2026 01:17:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-63a8-e900-0915-3df6-8525-b963.310.pool.telefonica.de. [2a02:3100:63a8:e900:915:3df6:8525:b963])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm28393931f8f.27.2026.10.28.01.17.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 01:17:42 -0700 (PDT)
From: Tim Pambor <timpambor@gmail.com>
To: maz@kernel.org
Cc: Frank.Li@nxp.com,
	afaerber@suse.de,
	alim.akhtar@samsung.com,
	andersson@kernel.org,
	angelogioacchino.delregno@collabora.com,
	baolin.wang@linux.alibaba.com,
	bst-upstream@bstai.top,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	daniel.lezcano@kernel.org,
	devicetree@vger.kernel.org,
	dinguyen@kernel.org,
	eleanor.lin@realtek.com,
	festevam@gmail.com,
	gordon.ge@bst.ai,
	guohanjun@huawei.com,
	heiko@sntech.de,
	ivo.ivanov.ivanov1@gmail.com,
	jbrunet@baylibre.com,
	jernej.skrabec@gmail.com,
	jesper.nilsson@axis.com,
	jonathanh@nvidia.com,
	kernel@pengutronix.de,
	khilman@baylibre.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lars.persson@axis.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	michal.simek@amd.com,
	neil.armstrong@linaro.org,
	orsonzhai@gmail.com,
	rafael@kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	samuel@sholland.org,
	shawn.lin@rock-chips.com,
	sudeep.holla@kernel.org,
	tglx@kernel.org,
	thierry.reding@kernel.org,
	wens@kernel.org,
	will@kernel.org,
	timpambor@gmail.com
Subject: Re: [PATCH v3 11/17] arm64: dts: mediatek: Add EL2 virtual timer interrupt
Date: Wed, 28 Oct 2026 09:17:16 +0100
Message-ID: <20261028081716.75598-1-timpambor@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260523140242.586031-12-maz@kernel.org>
References: <20260523140242.586031-12-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_011745_755281_3856DD1A 
X-CRM114-Status: UNSURE (   9.52  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 23 May 2026 15:02:36 +0100, Marc Zyngier wrote:
> The ARMv8.1+ based CPUs used in a number of Mediatek SoCs are missing
> the EL2 virtual timer interrupt. Add it.

This patch doesn't seem to have been applied along with the rest of
the series. After updating to v7.2.11 on an MT8195 board I see:

  arch_timer: [Firmware Bug]: VHE-capable CPU without EL2 virtual timer interrupt

With this patch applied, the warning is gone and the EL2 virtual timer
is used as expected:

  arch_timer: cp15 timer running at 13.00MHz (hyp-virt).

Reviewed-by: Tim Pambor <timpambor@gmail.com>
Tested-by: Tim Pambor <timpambor@gmail.com>

