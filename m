Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4472606D80D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UETNi1xC;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=VmuuHQbT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=28vupFRCAsQEK/lZrLM3S/FU2qxtBOxPy/hwdr6RjB0=; b=UETNi1xCHkTkdv
	6lP807cBwbWmbvvswAMRx/oytQd8nvhuFpDL/gQCLB39K23ipwsfa00n3JmiVS1FYL2Gvjk7i5WsN
	RS8IXaYEzvV/fs//nGn33GmexOR5mpdgpGkPd8hC3Rrl/WgbxHomqzeGWOyY6Lx2gw2TdEN6iTQcM
	FrW17ypeeA4333VePf4ETViNGGBq1nXW9aURu1jOSIFt4aFtNbaxsun2KXvg1m8/FYN9EFdS55moP
	0gwgZhCUkGf1JJFgCknGS8RoLvnAYEgvGEbnCEczAMc2ArtlGVNIQ83+MvB8NDW1hKTkMVtvGSxIe
	YtP6ZyWSB3+3JPBpaxtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYpX-0000000564P-205m;
	Wed, 04 Nov 2026 11:06:59 +0000
Received: from out-155.mta1.migadu.com ([95.215.58.155] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYpT-0000000560c-2XfG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:06:56 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=NghsSAOsNM1EUmMpvZUVbGu97ngzH5wIbFHRrtkfsWY=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793790413; v=1; x=1794395213;
 b=VmuuHQbTlg+J1MQBsJEYvffYl8L/eFSy2iRFOOTgbf1RriM0GgVtjYcAzHj8K8liMzXLp0xY
 X7UvzW0FeMQA0ujMXfAl02p6bdkabBDH6HoAgIQteeVE3SXR9wWAX6Hg9r/qDFa1gFLKIuhoLZ3
 S6Hfc6a57zfWNURm+cWYLUC2GUJb20T20+K2nWWT3nCdvScVLjCG/SE/HHhbCEKXI6ToSAN8gZv
 tZshpbNTzv2694g8npfBMz+Gb8zE+X1TwASILLEAG1Fl0ddEy3pJKKOsraaI1g8yRFbg4XiVv1W
 +Hx98/AUqhZ5h5armBFDiajQI4i2wqLDwcl5a+rOfE3jA==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b32100028a2df84d;
	Wed, 04 Nov 2026 11:06:53 +0000
X-Mizu-Trace-ID: b32100028a2df84d
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH RESEND 1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPC-T6 Plus
Date: Wed,  4 Nov 2026 12:05:04 +0100
Message-ID: <20261104110640.1132917-2-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104110640.1132917-1-diederik@cknow-tech.com>
References: <20261104110640.1132917-1-diederik@cknow-tech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_030655_787690_19A32748 
X-CRM114-Status: UNSURE (   8.38  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The NanoPC-T6 Plus is the latest addition to the NanoPC-T6 series.
Add it to the NanoPC-T6 list.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cf..97d414024119 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -406,6 +406,7 @@ properties:
           - enum:
               - friendlyarm,nanopc-t6
               - friendlyarm,nanopc-t6-lts
+              - friendlyarm,nanopc-t6-plus
           - const: rockchip,rk3588
 
       - description: FriendlyElec CM3588-based boards
-- 
2.55.0


