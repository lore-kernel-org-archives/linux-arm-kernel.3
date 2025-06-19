Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD67BC7115E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+ExZuBnh9pGa+47OhDj0dfV3nbZaO+zZgcd+Aeq+Dc=; b=q61LZz9QSZ9XAKTEgQ3o7HqIHa
	ATRxPWw6R4LY3lNjMBz/ewJ8kv6uaG8PoiRKTLT0ZBsD6qgykr86QaCN4Br4OcNjZCRlpGZZ5z2tS
	WVgDPBk0ihd+I8z9Za3w0lUguhoFPUZp8e1hs5WcJZ6txXKdtArLT6VMa5fCWgBYwmIFez0nm3gol
	+M2qi22sT9sPPZKR/Vg8xSDNkUCoPo7atauuhE+tjJLFW2xIvok74tqqKxfo0rxSS9olY+cBrpMfQ
	OVpZ9/STqaC/nRjR+/lx4eBPDnpl0EdimQKntozNM8fklMar68LSma6wK5wRhgIon5enMy2vrffzF
	AGHX3M3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSACn-0000000CNbT-1PRZ;
	Thu, 19 Jun 2025 08:01:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9gm-0000000CIE1-1FW7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:28:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A4CFDA52C42;
	Thu, 19 Jun 2025 07:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378CFC4CEEA;
	Thu, 19 Jun 2025 07:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750318079;
	bh=iOlTmiQ7xPFtsZHsUbIdlvX7JUBY0JdnvF8PrsNFm/8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=gaB5u+bEVxLD/mYsswxJ16PKoBySIRDFJpEeE1ylH9QSBF3kiOCIzpulEVop8KvxS
	 PV2ZFo5ZCrL91xwCAbpFVz+IA6T8Ra/P67KjkQQBSFnhVt8wu4yX2EnjGHMcSP/95c
	 a1QZPLXopETaPIm08x5jL9alv0s5YBieBIhYFgGImJKFJFiLBv5FxoTN+JOW5qerPy
	 MZ3g8of7MXQ1q3mYdICkEaxh/zQ3xGYS/svB/QWASvSywyUjakkGh9DsvoX4pG9blZ
	 FEBn4gCTXx/dKoOeE0aCxIgmr1vVBBhp1/tApFxKbYP7ii6IC9ZoN3HX0WQdyZCDK1
	 MgooyxDkuJ0jg==
Date: Thu, 19 Jun 2025 02:27:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lpieralisi@kernel.org, l.stach@pengutronix.de, mani@kernel.org, 
 krzk+dt@kernel.org, shawnguo@kernel.org, linux-pci@vger.kernel.org, 
 s.hauer@pengutronix.de, imx@lists.linux.dev, kernel@pengutronix.de, 
 bhelgaas@google.com, frank.li@nxp.com, devicetree@vger.kernel.org, 
 kwilczynski@kernel.org, conor+dt@kernel.org, festevam@gmail.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Richard Zhu <hongxing.zhu@nxp.com>
In-Reply-To: <20250619055515.74675-2-hongxing.zhu@nxp.com>
References: <20250619055515.74675-1-hongxing.zhu@nxp.com>
 <20250619055515.74675-2-hongxing.zhu@nxp.com>
Message-Id: <175031807810.3855277.3097205651899770638.robh@kernel.org>
Subject: Re: [RESEND PATCH v1 1/2] dt-binding: pci-imx6: Add external
 reference clock mode support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_002800_398697_0AB9D678 
X-CRM114-Status: GOOD (  10.48  )
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


On Thu, 19 Jun 2025 13:55:14 +0800, Richard Zhu wrote:
> On i.MX, the PCIe reference clock might come from either internal
> system PLL or external clock source.
> Add the external reference clock source for reference clock.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml:224:15: [warning] wrong indentation: expected 16 but found 14 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250619055515.74675-2-hongxing.zhu@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


