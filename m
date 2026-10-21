Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F9C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f2it/gaW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6wPTEcw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4XcTB8uaM0hhjpS8gstVWyDL4QHXRc1Kk4cu0DdNtY=; b=f2it/gaWN5Gco6
	xqx3H9dX6w5poREqgGcu7GfLIjnbHVmhdwObMUaUH6mD1MqFkJ6vTtgfW9rUaf1v6GpoXn6BUiyOp
	Zj2xfUfYkuRlQ9eG/SRKMJ3wjIeR+mvnDabSQuKVrBnvj8X+YNP8ciLXvkDs0+6s/2EA7Rbq1UqzU
	wvVvV7tRBStmdV9zT0EQvyr0LOJccl/T5DlkprekOxboMYFSXFRLhgLMtUb4YiILo0hhhQgN4F+kQ
	cH+fPTJ+mPNHXmHdfpHeRNwjirDboItXQxvShzrsPVCMxqtTYDwT1nQIVSxMqJLAZNPcxd21v/3Wa
	blRD7Fusv3lyl0aGps4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQRD-0000000BEFC-2Ezq;
	Wed, 21 Oct 2026 07:08:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQR7-0000000BECP-3JZd;
	Wed, 21 Oct 2026 07:08:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E86060A68;
	Wed, 21 Oct 2026 07:08:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792566512;
	b=pTxMr2vbUKzkVVcweGd6HxPScQzEjvIeNH3VufyRDYhGM+xtr4CBVbH1yPEC44kVrOT5
	 zOl+lf/gF4qT3mY3+s64ffPb6b8PjthhN2t3r73vFmAqkf5qAX8BAJU5O0nhdHcyCNB//
	 3aX7jSYDokC9lTOVZv2vOtMOGcM/tXN6vzupUrAJQ4Emwvxvd1s8XWFS3mvH5WrHCPWX8
	 n4o7kC6fQJvkTIHaUCAAyr7Ob22C66To/nwLFgcOdo6nEBm4UWkVF9KzTywyC01rFB2qE
	 6rjaeoofueP+2jUqSiDjyxozawTqg1r+AOyyEQ9nC+ZR+RFqNZa3Y7E6E9PDtdrljyw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792566512;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+4XcTB8uaM0hhjpS8gstVWyDL4QHXRc1Kk4cu0DdNtY=;
	b=k9fVs/IfNc7fx8YMSR4u9WWu2lKvUUOIc+lJMvdQDa+3gxWZMdVVgrXMn+ih0Onk8u5g
	 u0g9Awbs2YFyhhnbpH8OzXidDqGLVmN3AwoFINTXDayejQ9lSfxy0jIF5s5E6bDuQoZPZ
	 VcQEjZqSlx3YQufcSbDHf5yBkzIqAuAirPW6+P1V2LVyR6RHKla02K3aUKquVyfaGefTw
	 81Ngyj5BgwCM7mrqPLpC/ZheMI1g7PquGwqk3ObgkqDqtlY+8lT5fwUGNOECqPq8lhuCT
	 M/6vsjXK+1Fkth2cOy+Y17cynzM1E81MS3OoXl8OzDMWVS4NLPZWDb8lq0fR3/Ti9NQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A58591F000CA;
	Wed, 21 Oct 2026 07:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792566512;
	bh=+4XcTB8uaM0hhjpS8gstVWyDL4QHXRc1Kk4cu0DdNtY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=N6wPTEcwvcIH8P3RGguNYWNg4LNiO5EXV9bs7FHsjQt1qdH9KoqSjpM2MtC2QgorU
	 Wf/FBKK5hBqrELJcL9ba+WA2OEzJwUajNLPuhc3LL7lYv79LdIaplCQyHlIXq0xG/n
	 HUDTtH5E7wMpotyWnTPJ2sryahjQ3+1QMViATwRQ2/c72rWV88CdXyNO8AkHrYMTIr
	 jn11OuqWfPz0xBPEjNCW49GA67PocxsQuezNNfRxahT2t5s4Mpqh02QzTnLwrXcN3t
	 IEiGNtGs+cVgByS9Yu5oVjMq5IPZrEl68licyeLPTe15EaDVQB3q6P1Y+BjThE1mVI
	 52dkt9bAZPRzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0F167432EF;
	Wed, 21 Oct 2026 07:08:31 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Wed, 21 Oct 2026 15:08:28 +0800
Subject: [PATCH v7 1/5] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261021-audio_drvier-v7-1-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
In-Reply-To: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792566509; l=1643;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=Rx5wFB2nCKDMgS2AxdE5dKUFuTGBEHrm0nwe1wxO0Fc=;
 b=eBhduL44M/Hu7Y49Qv9Ch18NOTLGupOewGkhCiJANoMMipUyXfSkugV1wPhCTVmX6IqGc6e1O
 aYHYA0HYRvqBCf8ZzedfhFWWrzfRiOhCLQP46zS7kH0jK0336EZK5PD
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jiebing Chen <jiebing.chen@amlogic.com>

The audio power domain has been found on S4 device.
It must be enabled prior to audio operations.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.yaml          | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
index fd7982dd4cea..69f5fef5f14a 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - amlogic,axg-audio-clkc
       - amlogic,g12a-audio-clkc
+      - amlogic,s4-audio-clkc
       - amlogic,sm1-audio-clkc
 
   '#clock-cells':
@@ -100,6 +101,8 @@ properties:
   resets:
     description: internal reset line
 
+  power-domains:
+    maxItems: 1
 required:
   - compatible
   - '#clock-cells'
@@ -115,6 +118,7 @@ allOf:
           contains:
             enum:
               - amlogic,g12a-audio-clkc
+              - amlogic,s4-audio-clkc
               - amlogic,sm1-audio-clkc
     then:
       required:
@@ -122,7 +126,18 @@ allOf:
     else:
       properties:
         '#reset-cells': false
-
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,s4-audio-clkc
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
 additionalProperties: false
 
 examples:

-- 
2.52.0



