Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA5DD16816
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZmF0FSDjjhuramhZj/wmnOkap/wWgMgFMYGuEdcLhA=; b=WSJowwC51ZkEdnqnPDF97ig4pf
	kQXxzVqMFenDOmCv8UXgB8+Xu+YXny1CyeNENlL3lxWrij0vXtbZ7rrtMwm3QoVYH1h+UqQ5LP2Wt
	WFl37+ZPm7aKcQ8m5kIpkg9KEmheihFtVO8TnNktHN89dyEA2tIVjza40bXhrgqb7fcxg5GWt1rdf
	JSDN0kLs3/9u0al+sRL5vwL2++vF24g/pQFkyN5fTC7au6RfzHA4eltMRg9x9y2GdNuLk0tCZFnNS
	4pJ88Ca/0jfGuoyBoXwFM6uEreC6kDJeK1AaTfWByYB0HfiUZD3ENFmjA0X6QiQWYaAszTdh9chgE
	8ez+hsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAg6-00000002DU6-0GvU;
	Fri, 09 Jan 2026 11:29:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAg3-00000002DT2-3p95;
	Fri, 09 Jan 2026 11:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24D1144440;
	Fri,  9 Jan 2026 11:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BE8C4AF0C;
	Fri,  9 Jan 2026 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767958149;
	bh=uuvtHWXbur4b3UNiVol3kfUJOuEa5Q/2AL1FzGgXs48=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FW5xbNLBDmErOr6Ze5BAvusMexofgauPk70Ccu8+L6xSAvXOW+UrTddAEucxw7/zs
	 R57upHBxrHYe9aOFaKroXtLzUFVkA1gKnzwmfTJqY0/PcPMvx7e9AKBgv/edAkRE2W
	 M0IIBjbS5dhEwRW2VyAHJkXK+6b78O2VNuIZqSKeRCS05kNuGf0rYbF6cyxug0JClw
	 OoHOzvoVA3aHcZb1jtfd4DweYlUgKNphNreAzyBzb4+gKHuG1PE0O+K/J+/eN6g4za
	 j93/js3oFH7PvoyxwCFzN7VLQ06ZRkH8hACeikn0xmkOW/W+Swr2K60xQt9xWUczXP
	 3FclL3Mu64/fQ==
Date: Fri, 09 Jan 2026 05:29:07 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: SriNavmani A <srinavmani@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, openbmc@lists.ozlabs.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michal Simek <michal.simek@amd.com>, linux-mmc@vger.kernel.org
To: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-1-934f1a61f7c0@axiado.com>
References: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-0-934f1a61f7c0@axiado.com>
 <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-1-934f1a61f7c0@axiado.com>
Message-Id: <176795814783.2967277.2609413382098901076.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: arasan,sdhci: Add Axiado
 AX3000 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_032911_972156_3FA00705 
X-CRM114-Status: GOOD (  11.15  )
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


On Fri, 09 Jan 2026 17:46:25 +0800, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Add compatible strings for Axiado AX3000 SoC eMMC controller which
> is based on Arasan eMMC controller.
> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml: properties:compatible:const: ['axiado,ax3000-emmc-phy'] is not of type 'integer', 'string'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml: properties:compatible:const: ['axiado,ax3000-emmc-phy'] is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.example.dtb: /example-0/phy@80801c00: failed to match any schema with compatible: ['axiado,ax3000-emmc-phy']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260109-axiado-ax3000-add-emmc-host-driver-support-v2-1-934f1a61f7c0@axiado.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


