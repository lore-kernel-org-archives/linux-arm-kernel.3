Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD1DD5E372
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bV2Cb0tVE2zNcXSw+nBnOVo1WxAzIolvbyJRwXoLbBg=; b=HjZbjTftmaZZuflaTffmUd60SL
	KYSExF4mNdAiLJLAOP57f1WH0/q23Gr4UcZ5HuKo/tP0GtQZexBcxRfjV6EB1lEYjiX1vwYU8ipXy
	WqxFFVRHkpIZrFIC3IxQ3GYX7krcg+2NvBiw55MZTyDSpRzMicH2Mtu3SHS2/nPZDuXoI609vk6Ag
	W1FsquJCy0/uuytWzz2e7DZs1uSky/ThRNDTLWP8vcgI5KhStmnqT6PbeU1UQRqH01hYKFlWXJhtd
	ucUfQ4/hO71kGgyBB9VGZis8LwG2xvU1Bn/Sbi6u9Ih5/92jxuMjOK0ZT9WcIGMtJbX2bMmgUwQ1q
	Q9XwkDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9mhJ-0000000DUEy-3e26;
	Sat, 09 Nov 2024 14:44:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9mfY-0000000DU7b-2rm8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 14:42:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18636A40134;
	Sat,  9 Nov 2024 14:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E261C4CECE;
	Sat,  9 Nov 2024 14:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731163351;
	bh=T4NsAzzbrxsGN654m3HITV9plHMlIDtNUng5/+1hPwk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=uz9uWSgBfXnx0ngUIW6rGUhDMz6o4EtZKpNd9RDvNDRoCEaMuotCAkm2d4Chy5Zy1
	 a7pdXeazJuzvDabfD8GLXkXQcQ4Eq4Mzi0VsItmyCiZwdYddAWNNZFt7gYe8W/u8Gx
	 PJ1dENMsxPXCtFXUt6K11XSgsji2lV3Ju840+tPSR5tHexV8bdkxdDUcx9k4qSsQqD
	 ntBdtIQAIW030BQRqrOymC7GLrzp+SNpO4VbuXnqwZjqHm96m+M7JVcqiog6yfzEdw
	 0dzP3DtDV56huciH2OoHZT+KSmsnwsEOCuS400TsQHwYAzLGM+qD7qWaJgrY+K7dd9
	 DV49c3RRSJOig==
Date: Sat, 09 Nov 2024 08:42:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 imx@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
In-Reply-To: <20241109-b4-max17042-v1-1-9e2b07e54e76@gmail.com>
References: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
 <20241109-b4-max17042-v1-1-9e2b07e54e76@gmail.com>
Message-Id: <173116334945.561244.8973169174943598746.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: power: supply: max17042: add
 share-irq node
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_064232_805895_06F9D901 
X-CRM114-Status: GOOD (  10.35  )
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


On Sat, 09 Nov 2024 15:44:33 +0300, Dzmitry Sankouski wrote:
> If specified, driver should request irq as shared.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml: shared-irq: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241109-b4-max17042-v1-1-9e2b07e54e76@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


