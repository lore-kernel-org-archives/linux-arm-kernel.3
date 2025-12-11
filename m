Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEE3D41D6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 17:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foEoy2VhimwdSNLHaetZA4VraBbXQ0nSWvrWlsrf9Mg=; b=1y1btE1BDXUX3LgrYaymIwGa8R
	F78auZtmmej8PoSVliqY44JiA4ZtJWNTd7Fq07stHxmr7KeDxvwlR/hWdPTedlLnydIi+qI4tuSdZ
	jfxgPo6mYc4AmcCU24qreydYOLmA7X4ZsYiRnpRGrsVq9h/9aF+UVl3lEDjAft9t5pqHycOdXMOVn
	Tn/vMZKwwWsHibwxTQGzxDd5ify/fqP/UoDRHaWeQcsLD7uFprmgp0rvBPuR5z6pptXqA7PYlmWV4
	jiH1ZnQlAe1IthBSaopM0H9FvIkyL7AEXbMu89trvphxt/TgJ8d0NuRPl0pk/Q4f2sTr4O9FGF4qt
	616oSrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTk4n-0000000H0BD-3oBn;
	Thu, 11 Dec 2025 17:03:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTk4n-0000000H0B7-1QlG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 17:03:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65BD460137;
	Thu, 11 Dec 2025 17:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA11C4CEF7;
	Thu, 11 Dec 2025 17:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765472616;
	bh=68tWRmyf6VMzwULZOQ9jRTGMGeauu+h01vr63fws4Zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YEraNML5j0inR9DRN3T0yMvKx/qUMlxrX6pt2w1kQXcFJ+dgklkcBrCl7lJfcXoP/
	 KQvm2lFNs2jtSb6TCrIUIbE81U47bZzYY17kRquywMWpeEUQeEnhNQZVCrEc7wfZ+D
	 H4u4TN6uPjrBANyvOvTwPDse6CRUlkGacZ8M3ygNWdw/A4SdFSB/5BKX8YYUbJBN3T
	 rwiLbiIoIAcOYnHMyqsVbuypBi8MrNEPQ0aVeLtEiufHBhNCknAN3HJbuv+icg8U3u
	 vvwIggyYfHT3kFAPIzeqq4hj8GV97HM7LEoMSSfBMtzHmmBgLEZhbqJJg90EOtm3VG
	 wM0ep5vPPxi4A==
Date: Thu, 11 Dec 2025 11:03:33 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH RFC 06/16] dt-bindings: mmc: Switch ref to
 sdhci-common.yaml
Message-ID: <20251211170333.GA1557987-robh@kernel.org>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-6-21b18b9ada77@codeconstruct.com.au>
 <176546866607.1487115.6798113196659439308.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176546866607.1487115.6798113196659439308.robh@kernel.org>
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

On Thu, Dec 11, 2025 at 09:57:47AM -0600, Rob Herring (Arm) wrote:
> 
> On Thu, 11 Dec 2025 17:45:48 +0900, Andrew Jeffery wrote:
> > Enable use of common SDHCI-related properties such as sdhci-caps-mask as
> > found in the AST2600 EVB DTS.
> > 
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> >  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.example.dtb: fan-controller@1e786000 (aspeed,ast2500-pwm-tacho): #cooling-cells: 2 was expected
> 	from schema $id: http://devicetree.org/schemas/thermal/thermal-cooling-devices.yaml

Not sure what happened here. This is a real error, but on the wrong 
patch. The already applied change here looks fine.

We need to determine 1 cooling cell makes any sense or not, and allow 
for 1 in thermal-cooling-devices.yaml if it does.

Rob

