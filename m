Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4242F103A9BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfC+v5wQ/S2ZkrvjOkc4NDp0RSFbYhaDvcnnuHc4uIA=; b=VcefNvp/Fn12Sttk4aphh49UVY
	+rrjmv+mUXFVxnRWTCy2NCuiViktpSSBAuthSktC1fwRATpF2m0VhFF0FObbHtVW6OSTgbpnfm/GI
	i+nGQqZq0l8hEeOGpdjTekuuk+D+nR+yTnuzrfAPrBHO4Sxl7syhXRq0+qF9v/+9lvbn42LVuVPJ+
	Ax9zW5jMD6TN2cW1LhlcdfLpRloVD/E0qiC+/uzwgKHftibjpiKmYUfpsniY2g0iZiPhMcAZyWGz2
	jA6Qj976IpB0H1Qsn6emRfqaaVsmsk0PdcxxG77AXoB775cS141uBlOXuDSWuI3yflQKjKY/6fPjX
	jJMync4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MX6-00000003HHY-0I6w;
	Wed, 25 Mar 2026 11:36:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MX3-00000003HGz-0edy;
	Wed, 25 Mar 2026 11:36:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF9C94380C;
	Wed, 25 Mar 2026 11:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437AAC4CEF7;
	Wed, 25 Mar 2026 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774438576;
	bh=gIfmwM1ItjblP1jQ+Pl5kvXyMwrWzxXmDO7mvHKi8eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRpaR5oLdwChv0xlMzRaOv09Qgrshs9k0Hwj9biqcbdQEytZ2TSAWMSqBxBXIxF9p
	 qtAzT/9vJr9pFJOFAA00usQ6RAvEGK9KpmEgil+tFF370yW+KN4VQpP+8idNmjxvfA
	 a5LiGX4XEhC8k/S3MqvzxvB4drk2oUcRDRUCWKwcV0RqmZSrRz2cddU5UbkWLeY/lu
	 jvSuJ6QGEXtIcLUf5HsvmRktqxyz8Fy5fGctO/+1Wp1itX76mMnU/RiTj6o4Kmc8QS
	 PW8SQI6Fs4hMaKddGxoSPrPvXbrL0GuFvVgt15B2/ipa3dvIO/Q2GRFT7GLbX8J9tb
	 0MhoCZvC+w/2g==
Date: Wed, 25 Mar 2026 12:36:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: broonie@kernel.org, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ASoC: dt-bindings: rockchip: Convert
 rockchip-max98090.txt to yaml
Message-ID: <20260325-hospitable-fluffy-hedgehog-bba33e@quoll>
References: <20260324135508.839142-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324135508.839142-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_043617_212716_081BE413 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
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

On Tue, Mar 24, 2026 at 10:55:08AM -0300, Fabio Estevam wrote:
> +
> +properties:
> +  compatible:
> +    const: rockchip,rockchip-audio-max98090

Not the best compatible ever :)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


