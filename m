Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BA5F513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 00:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gn7w0ccREMOF+J7DNwqJycqp/bXjUCrtSvPENYYs064=; b=Gmkr6dbbp52lKwtAj+Y/j4JmJN
	O91I/uJdNzFYpV9XNgojvWWfsRpQpWBLwer765Fkrdk7e21zIuv2oC45JW4tMzWFCWs4fAHbSZyfT
	aTprelKch7Uj1Pmgo1dWa6q8OWSb2S/MEW2LpQn92doHh8BuROsB1zLKT19UH8h0og4Bx5/HYTlRv
	Hy7fvvyBYWOtl16eFTh4rb9wP54BBy+ySsjh4/6LsRLsqSA4iGPqcN0ivBqkGCZd/YKuQp0P94Dqu
	AmPdSiR8y9Fyr73ZpR9EWqUZ6U0NiW/MoTbRv5kWCLCoNWKLZ5sOoRdVy4/MPwQlgW6g9yt3imfAc
	c8CPD2tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJLZ-00000002nhT-2VD7;
	Fri, 06 Mar 2026 00:47:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJLX-00000002nh9-1sWX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 00:47:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFEB643863;
	Fri,  6 Mar 2026 00:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3F1C116C6;
	Fri,  6 Mar 2026 00:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772758034;
	bh=41HneZpqdxSPUGTmYllaKhbcIbsLHd2mvz+gz7Cu4GA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0R9ZvIDnO9byn3IdhEhtqB2rAkSaBf545dfLFR1ZiPp4CFcKAw0q/OizBmobAHLh
	 yx5GecIRO5b64rWW3ia6Lut9L81Q59KQvjCvixdNOKOFRe0v8UUbcAI0wNk+D6RPwx
	 qzOY7rI7xJdHXk9l713+v5w2CLEHuEkOTgBzhatM5jmAagjXIPBLLqb0DcrquXxBns
	 ApHhPhZFIybngg1qF/TCt54cgXTFS72qRFoVtjWPXpys/q/C9HiRzYDFUml0iQTzaY
	 WMw0CJFPEk8XFfbG9/vsQV47iGY43ew+H4GHyxuN2YzSsq+dYIhmRua63wI2lErsWo
	 Am8fW0/+XkvYQ==
Date: Thu, 5 Mar 2026 18:47:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: generic-ehci: fix schema
 structure and add at91sam9g45 constraints
Message-ID: <177275803136.874627.15836602722441191770.robh@kernel.org>
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-2-6d6a615c9c47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-atmel-usb-v2-2-6d6a615c9c47@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_164715_525370_44426C45 
X-CRM114-Status: UNSURE (   8.96  )
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


On Tue, 24 Feb 2026 13:12:59 +0000, Charan Pedumuru wrote:
> Add clock and phy constraints for atmel,at91sam9g45-ehci and reorganize
> the allOf section to fix dtbs_check warnings.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/usb/generic-ehci.yaml      | 46 ++++++++++++++++------
>  1 file changed, 33 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


