Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73DB606D81B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W+2PPdUj;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IXpnNgIN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JtnP2Kmt3o513W8ZN25ivNSHMfIQTn2OfI3LInIkTz8=; b=W+2PPdUjYMZbRlC7l2LFjkIiQW
	65f8sJsVzQCQ1hSb/M9IN909aYRXcOWmp2VGaI42dk0ZdweFPerXzE6RaeH0sjbn007d58vc+SEVl
	sqeRjXqluqxhtggSfKc/6GZAYvmk7S6PJUergFBlazqn1ZWfjZss8/maXLnfxNnGA5gSBTAleuASv
	kNCS7CFb+m/7N1Dk0TV9aD9JMqoGSv5AjNpAFaAXXK6OQYNQHpRgAWroXUwKEC/n4ANOCDMoRCKoe
	YGkGK22Yn3yDpUkIfolER6LysgCPyzE+6TsHJG9zHR0iKMpo7cVE/iLh2igi5aK/7sNXFg2VpuDt9
	5uCckztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCuB-00000002F5c-0qtc;
	Tue, 03 Nov 2026 11:42:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCuA-00000002F52-0LCT;
	Tue, 03 Nov 2026 11:42:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A6154324B;
	Tue,  3 Nov 2026 11:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0461F00A1F;
	Tue,  3 Nov 2026 11:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706137;
	bh=JtnP2Kmt3o513W8ZN25ivNSHMfIQTn2OfI3LInIkTz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IXpnNgINgSEAHEMFXORCm01bjHLe8Jqzudl5gkpcqfqYTic8HdXBqs0qpuCJDm7L5
	 ZiSlZQ5u+EjuWfkIiICpeC5Bk9y6MvV09noWc+p/eUl36tmfHISFjgf8acE8hAXnqm
	 hAN4CAALutN7phmY1DIlm6jT71dFHeB1MCIetJC3/nBznVar4F0hfhTjTPNuYmNMWc
	 Y6B2f+R3wFHoQEj6rQYPB3FW3mqr0eyC7eJSaa3jftESdkUE+gre1VLbagAwtiF1rz
	 XdfP2+a6ruN5wStDTJibT04KZ2dXVwwZFJUPit86hTSpwq4ujenKTKomXcUSH+iuNH
	 E01gXC4DDPD4w==
Date: Tue, 3 Nov 2026 12:42:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junyi Zhao <junyi.zhao@amlogic.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-hardening@vger.kernel.org, 
	xianwei.zhao@amlogic.com, Kelvin.Zhang@amlogic.com
Subject: Re: [PATCH v2 2/2] dt-bindings: i3c: silvaco,i3c-master: Add Amlogic
 A9 support
Message-ID: <20261103-emotional-objective-jaybird-0627b5@quoll>
References: <20261102-a9_i3c-v2-0-0c474bfccffa@amlogic.com>
 <20261102-a9_i3c-v2-2-0c474bfccffa@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102-a9_i3c-v2-2-0c474bfccffa@amlogic.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 07:05:40PM +0800, Junyi Zhao wrote:
> Amlogic A9 SoCs integrate the Silvaco I3C IP with two controller
> instances:
> 
>   - amlogic,a9-i3c for the EE domain, which takes two clocks,
>     "pclk" and "fast_clk" like the NXP variants;
> 
>   - amlogic,a9-ao-i3c for the Always-On (AO) domain, which exposes
>     only "pclk": its bus clock is generated by an internal divider
>     located in the controller's own register space.
> 
> Allow both compatibles with the "silvaco,i3c-master-v1" fallback and
> enforce the per-variant clock counts.

This we see in the diff, but we do not see WHY.

Best regards,
Krzysztof


