Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D801094471
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ch/HEZzPJMmQEe3oXDemPO0ZtC9xlqINo7y2KSmP0vA=; b=GqGpO5OAip1na+V008mQlGyuHy
	oohMF5mjeBTaejHQSLO2ZlvZm3BvecTAyqffn9CfX6Bfd5CU9oRw+VsIXOnNlNoEk1cP1FkRsJjsg
	QtV7pyosKF3fQmyO/ij/wT2hqDGsZg29hTHk3Ww3sDQsK9YlJ9+Jzeh34ofY55wiR3IF2T5tw7wiW
	PmoQPTbSBa6Z8bg39flp1YJODo1WiNEYn9bohExgGcthp9N8sBVus1vGyyQih+wqzlEiTXYZlWXmi
	4OGbVPuAwFEjkoYiz4JhMOkqe9zN4il6hlgKWUftjFrPxerUB5CzzPncWuVXuN6rssnnVelfly9TA
	R+TbITEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3wBo-0000000EUPr-2M18;
	Sat, 21 Mar 2026 13:16:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3wBm-0000000EUPl-1TgU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 13:16:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E2D8600AE;
	Sat, 21 Mar 2026 13:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EEEC19421;
	Sat, 21 Mar 2026 13:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774098985;
	bh=FTUy3SHKisCSb3aVqdeTnX/ivZtExz6zz8qPUm9jZFA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=fSS+0sA46I8TT2FNYNz+7ucPrPbu6XF6GOWjkK47X5/SqdAZi/gMKmPhodXWuRIxW
	 a4QlWXfJTX8+POg0uoNaILMjiVzmdhyFA/L0z8iHkyzgrZ2Y8zTnxxfXtFXWLcJyU4
	 RrFXm9PVtZ+2SSuDWa7XzOC1l7u6YrYwKyfFOS27te4xP7M/gyUNIc0HIu4NeS4fb+
	 u351MoOJwF8/SUvmYLVQOnZKFJUasnLjJJ+jIO1RsxXzF5bHmKHNWteK+WeeUwzplo
	 +AThnUbM/25aEkHIf25gHVjL6atlO8WVUUdKfG9V9iY/OldbQxPCZ0nmtKCOL48rtA
	 LEVK+1to6q9gg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 02/10] dt-bindings: power: samsung: add
 google,gs101-pd
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org
In-Reply-To: <20260318-gs101-pd-v8-2-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <20260318-gs101-pd-v8-2-241523460b10@linaro.org>
Date: Sat, 21 Mar 2026 14:16:13 +0100
Message-Id: <177409897339.266364.69715997034739052.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=krzk@kernel.org;
 h=from:subject:message-id; bh=FTUy3SHKisCSb3aVqdeTnX/ivZtExz6zz8qPUm9jZFA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpvpoiSSVkjLgy+SPAun4vTdN6OjGAsY6EB1ZHD
 a/yLk/mBQSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCab6aIgAKCRDBN2bmhouD
 12I5EACGV7PuLKZQwhTb6sv7cuMAGpNxYPttAYk1fa3JuZf2DQrLoCZiMeMHAb9pjUjCTpP8MCC
 0LYU1XsM/segNP1fyf9F6aYqD7haLQ0QnnHxjLANXMIexqbT1g2fgNVs0AZPmt7aQEo14uo5Trj
 gCIRI3XSpcnFhANTHs5LIAAW9+dxSL9BrB4We/UhCs0KXUXpOHoj9T8TuEnVwg0XOQCMuqyoF8Y
 E4IBX5L7dCHRo2q3n2LCqu3t58LLSAONSw7muGnUYOb8XCY1ZEuhIecmRc0L1Wl538Eb01srRVN
 N0p+f2xEPn5dM9CEiQ4utoHGz9WlhAmW1wczajWbrtX1WaiRlYFcfUaJ/mCFq6XQY4sReRxqQDp
 us2FKUBML+eNvHGNlOC53oqsL/eROHlc5FeF8RTLywO2j0SpxxABxKGI55oW6HYA+KtiAWEwyZ9
 oS7zeuzbzZAPKwRr51LvIpC7kyTXsNB8u5X0vPgFXP+XNQEwmtEeineZlzefnMdJan7kBvA2ZL7
 Lixmwi+ddWCt0ouetwLDUK089QwGjlSzvoQEGAjOFGC87X5ifUWVKmbKVvUG5sth9TFAXC/BP1V
 pVUM5gFgroprj4u6Xjt9Q6Jzh2WnqQ8GyPgLNR90cYlcP6M5C0+PcMod64+39rpmQrI5Glg5sGj
 Qo1PihFPLFdbd2g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 18 Mar 2026 15:27:47 +0000, André Draszik <andre.draszik@linaro.org> wrote:
> diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
> index 9c2c51133457..3f1a2dc17862 100644
> --- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
> +++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
> @@ -44,11 +45,28 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  samsung,dtzpc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Distributed TrustZone Protection Control (DTZPC) node.

For what purpose?

Your patchset is organized in odd way - first patch for me, then not for
me, then again two patches for me. Please keep it consistent. Or better,
decouple since there are no dependencies according to cover letter.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

