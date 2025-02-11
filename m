Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134D2C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jD+qwbnV1eEkj4QGYpx/0A3UOfeO8/TAkqA5LhTvPtk=; b=IxXyxOOLl3cbbw6p8Y47kJNcxw
	sLFArbu1T0tCgaBIWhpXolMDWbNQsm989b+HX3IKbI2Vc80IeZPZn0GIeFrvmHBGO+C2cpRdBz1ro
	TOk3jqZaYO37Ob4StlJ9yvJfe3Eq7RwLuqs3O7llOr63VIzDgnnYfWDQFdasg7KvraCPYdVQy8U2s
	tIsP46G8mjE07JQpbHbfxgxHOegrJIBlttr9vXS87GnUf8KranQOzeegac2R2tHcwT9O5bMMReIqK
	hI1mi+oaFoUQLgFwS154IyX1GDF3JrE2IapA8lDsnLJOOa0LP4eD5HyDR/JdupPkZyF08/ZCm1w/9
	1bX6nqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwds-00000005AfX-3rim;
	Tue, 11 Feb 2025 20:14:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwcT-00000005ASs-1U8E;
	Tue, 11 Feb 2025 20:12:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1C079A40C61;
	Tue, 11 Feb 2025 20:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105B3C4CEDD;
	Tue, 11 Feb 2025 20:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739304752;
	bh=v/Jok9KiEPoYdLkGoT5WJHe5oUzwY5NHLVXVVA+iJRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgY9IZVp67cVbFI4jfVr7xHVisU4vQHZuG1uZWlCrEFpbmg/2dNn4b/SuQvmUd0eq
	 CVT/QkfAtdvp0+v1yC0NXDVvzmV4xeu1X1dDyeOxYM13irap3UlVed8o3FtqY43MUV
	 /yoASTYArEkmeTqV/2DOvzzVgE1ytQqwU8toQtqau5UpYjKg1ZsC7npOemFAo2CXP+
	 bHKrvp8r80hHPa+g8Hd6z41qLUigcsUjraZ6ZBD6qBRWZkSWrx3f8TyqEF2bQYdNSQ
	 ySnRzKmC3aBxnzOtNbZMA9AeGIj9pMbZR9kqDyfnwWWYfr+78qRfb/Vs7lfYelK/Y7
	 k1zOIv5I20AsQ==
Date: Tue, 11 Feb 2025 14:12:30 -0600
From: Rob Herring <robh@kernel.org>
To: Dharma.B@microchip.com
Cc: neil.armstrong@linaro.org, ulf.hansson@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2] dt-bindings: mmc: mmc-slot: make compatible
 property optional
Message-ID: <20250211201230.GA600687-robh@kernel.org>
References: <20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com>
 <f6d7ffa0-6c08-45fb-9153-5e4aad1ca86a@linaro.org>
 <003ffa44-c88a-4234-a54a-50cd1140982a@microchip.com>
 <7180babd-302a-4f86-8770-bdd9f5c773cf@linaro.org>
 <7de20917-3176-4e80-8ccd-9c01c037cc9a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7de20917-3176-4e80-8ccd-9c01c037cc9a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_121233_517890_A3A3CE70 
X-CRM114-Status: GOOD (  22.34  )
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

On Mon, Feb 10, 2025 at 05:28:27AM +0000, Dharma.B@microchip.com wrote:
> On 07/02/25 2:47 pm, neil.armstrong@linaro.org wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know 
> > the content is safe
> > 
> > On 07/02/2025 10:02, Dharma.B@microchip.com wrote:
> >> On 07/02/25 2:25 pm, Neil Armstrong wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >>> the content is safe
> >>>
> >>> On 05/02/2025 04:48, Dharma Balasubiramani wrote:
> >>>> Remove the compatible property from the list of required properties and
> >>>> mark it as optional.

The diff tells us that. Please say why 'compatible' being required is a 
problem and needs to not be required.

> >>>>
> >>>> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> >>>> ---
> >>>> Changes in v2:
> >>>> - Instead of moving the compatible string to the other binding, just
> >>>> make it
> >>>>     optional (remove from required list).
> >>>> - Link to v1: https://lore.kernel.org/r/20241219-mmc-slot-v1-1-
> >>>> dfc747a3d3fb@microchip.com
> >>>> ---
> >>>>    Documentation/devicetree/bindings/mmc/mmc-slot.yaml | 1 -
> >>>>    1 file changed, 1 deletion(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/
> >>>> Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> >>>> index 1f0667828063..ca3d0114bfc6 100644
> >>>> --- a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> >>>> +++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> >>>> @@ -29,7 +29,6 @@ properties:
> >>>>        maxItems: 1
> >>>>
> >>>>    required:
> >>>> -  - compatible
> >>>>      - reg
> >>>
> >>> If you remove it from here then it's still required in Documentation/
> >>> devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
> >>> so please add it.
> >>
> >> If moving the compatible to its specific binding isn't appropriate (as
> >> per Conor),
> >> and if removing it from the required list here doesn’t seem reasonable
> >> to you,
> >> then adding an unnecessary compatible string in our DTS files doesn’t
> >> make sense to me.
> >>
> >> What could be the solution then?
> > 
> > The solution is right but you modify the meson-mx-sdio bindings, so
> > simply add compatible in a required list for the slot node.
> 
> Okay, we declare compatible as optional in the generic mmc-slot binding 
> but make it required in the meson-mx-sdio binding, which inherits from it.
> 
> So why not define the property directly in the meson-mx-sdio binding 
> instead?

Because mmc-slot.yaml is designed to be complete (hence 
"unevaluatedProperties: false"). There's at least 2 bindings which use 
it (with "mmc-slot" compatible). Leaving it at least prevents folks from 
coming up with their own random compatible strings for mmc-slot.

Rob

