Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8741C606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 07:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1vYtbMa1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MlCS74vW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uwm1M5LXW/yTgu/3JOzbMxTh7fefzGQL92I4Ehs9SNc=; b=1vYtbMa1vt9Rzr
	sWWCJMNggTDDt9mmlUtR0AzNpkrjquqmWLBm4fObp3I1L7Ec/WgEoChTWWF9viok5Kvjpcmzzq12n
	9IE+iAMsmfEU7ybUBx7YJLLBfmZt4virERret5jh8JC6XoApJfMtaASSU47Rh0VnyNFnO5Sn8suXi
	httIzYLh23VCQcU8hz5KFXAbyV/L5KylCsltKbo8z7FA6DQxznXqC3qfKAT4NW+3K+jY3Dl5qXI+O
	7aJyDCzkCmTwJvY+qHED/LhIdOwqBLPCcjhBdgh/IddU7JSonfOB2W2pin5zh89Yv7KoltsTA8ApJ
	lSzHCNU4wTD7ZLX2rNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQR9-0000000BEDN-1aFY;
	Wed, 21 Oct 2026 07:08:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQR7-0000000BECO-21lu;
	Wed, 21 Oct 2026 07:08:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8189060142;
	Wed, 21 Oct 2026 07:08:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792566512;
	b=g7eKeWPJCUx37Zh/lyEt33nZdUnWfAG4UpswDdgKYRuMNfDyPQa4x3XEbO50Z7265e8w
	 MNq0teaD3pCUkPW4RkoKdS/Vw6mWoAx0WCeOaZVU+kHd20hzEqCcBsbzGV1DhgROWo2sF
	 7v2vjagymPIWjcLrvzxv4NI4nrXYLDckCwR52Rq5XW2BwNKdzs/hDppQZXq57rTp3ffO9
	 HT1NyJ0VrJKmbY9ej2snpTq5CpxXS9lDwbno6j+ZWxCWXCOajbHFRT7AilSpi5xiJyrXu
	 SHxFYFxnBi/kH6JmsI7ypsbNveQO6zbaEvZ2i0JjPXd7TNGpRkJBDORm12n4e3Y1h6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792566512;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Uwm1M5LXW/yTgu/3JOzbMxTh7fefzGQL92I4Ehs9SNc=;
	b=PcuAUzN/vBmv1rN/VjJ7Qs4Pgs8bm+m/2znN34SrRzs6ZdqUcZ0I/29sz27MJCYglzla
	 yBAr5Usc8EpW5ezTJ9xn4eMW2abf4Jw3DQRlppQYd2hrqxBvpYEa7TUz+HhB9eboEFhvs
	 0NDlJtAjcfy3ly5Sjh8/d4clFtYhwECJEj8lw0pk/4/39AVMDnyE5GCMa8FyIyYOQUIRm
	 sc5vbxzndrcDhREJH8ywRqzXmX6+T8APvrdU8LevUBR8iVccvKiD3e0eh61Kyt2GxZF4C
	 uWllIzJB0rkUakoAozRyfNT1K554+iakv/3o429YOAb63qhS+oGjmhGPxdnluoulYKQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A65641F000CD;
	Wed, 21 Oct 2026 07:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792566512;
	bh=Uwm1M5LXW/yTgu/3JOzbMxTh7fefzGQL92I4Ehs9SNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MlCS74vW0+/Tk56hwXXuvqyD5R7kq4+7z32PhoNYCsp9pTpogzj/VhHyXpH4V0ybv
	 KHMX5wkzgKZAjBhExTvrpWjjCziAJaoEjykE2uC3D72LMgMN+4O8Z+B1VruVnufLb9
	 Du7B/bBiuIYLaoj1H6MbwOWvDsS4vaJ05HVZs6/MAFM2Wd3pbLut8rysmydbIsblE4
	 eOmp0olXa8n6yKUy6PUgEQSJ/DOSyv1s21grq8fYVt0DwBznvA+geD6PxVvA9XpCIH
	 8kwXgQV6Rog7kpkjS9vLu8Bmw/tUe4K4Cg0kXYkcrlLDKolpOtsHeS0dwySUc3maoK
	 Y9l3/zOxHj06g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 164F3432F4;
	Wed, 21 Oct 2026 07:08:31 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Wed, 21 Oct 2026 15:08:29 +0800
Subject: [PATCH v7 2/5] dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261021-audio_drvier-v7-2-2b9aeae9cb8a@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792566509; l=851;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=DMgqU4dy+C9otoBnz7xzg+U2RUB122T3zVnjUiL76gQ=;
 b=dCsYNVktGOqd5dEGjsOmG2lMjfuS47nelfFKNm2BCt6lTYEPBOLYVtrCNBeRKAfUmbqTpAn03
 oFuHqEvTTysCXTSxRj/pA3/kvJFkPYNkTKfrUOdoRf/1oySron6CaoF
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

Add S4 SoC tocodec compatibility support.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
index 23f82bb89750..7e053aaa0f59 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
@@ -25,6 +25,7 @@ properties:
           - const: amlogic,g12a-toacodec
       - items:
           - enum:
+              - amlogic,s4-toacodec
               - amlogic,sm1-toacodec
           - const: amlogic,g12a-toacodec
 

-- 
2.52.0



