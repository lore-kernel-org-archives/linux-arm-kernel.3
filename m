Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6ACFE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIkI8OldtEWsV0J81jkCNKWbiPuLh/MEUE+xdtmH7Co=; b=kNGITgnKM3IIsi9rHuwbSlByAb
	lCqZTrW/k1+nGQjwWXAYDP7RW+ILozRasb4BLIxt93nYvkeuKPOREzMa1Br3R4NZwUBU34v4R9/b+
	da+zxb0RN0cBwl6jqSkLqEm8nYO8ReBMU291F+Ech+nmlJsPwvjT8dqK3NCg+sh7TROX7c4RzalzO
	Cgrns1fpCZbpa/YJXfGh3WABYyCB0GrRo+wU3KIJsj6V3tGKwi5qQS52Dx2999OWXtjXouafZW59v
	PfCF7iV6EstMrKzX/4VPYc0H7nmsQ4kme+/Vp9L7Zd5abjFrX25Vy6NHQbOyRS2AF6JjKLZhnWx5l
	kDGuy3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCO3-00000001LTE-07Qe;
	Thu, 19 Dec 2024 09:00:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCMv-00000001LG9-2ei2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 08:58:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66293A41F66;
	Thu, 19 Dec 2024 08:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23FDC4CED0;
	Thu, 19 Dec 2024 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734598732;
	bh=LOK0TE+8vPsHm4UXCYz9e9AntHd5VpNaIBCeHki8HvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gs3SLyTtWo1ibINtCMTRJmvV7+mNaOqJmqKpp7i8wXxNG13erchRiZ6gB+FoDx/q3
	 OSeXvRYOLVMA/GxOkorAQrwmwPyRaqlffBsmUP7b4jmVJGhrMsYtiuDPtskxYRrdV5
	 aAViHJog/9POQyOB3zAoKRuVGH5718x9ALkGgGVKmdsSHdZFWRGSBe3ySYh0ErAn3f
	 xF42AAWtMMn0PH2llw3tOrXiVh8GzwlLhOpXIhI2L+JID35GhXOPBSjYMYmBZxNyyv
	 TeIVXjFF3kOaWJDt68tvDAwdYD125jw7x6pWH3mDxGwuC28yKRjD4ezLR0NqrG63Tf
	 Kzs/HOzcDviBw==
Date: Thu, 19 Dec 2024 09:58:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	"open list:MEMORY CONTROLLER DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: memory-controller: Document rev c.1.5
 compatible
Message-ID: <wxq5zzfh5jesucbbste2j6x2jtj45wjfc5xzjkqbqqta7cprda@oaf5arr3z6pt>
References: <20241217194439.929040-1-florian.fainelli@broadcom.com>
 <20241217194439.929040-2-florian.fainelli@broadcom.com>
 <2e33t7ft5ermsfr7c4ympxrn6l5sqdef3wml4hlbnhdupoouwj@gfjpbmowjadi>
 <93a1333d-442f-4cec-b823-9b1a5ff6dc6b@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93a1333d-442f-4cec-b823-9b1a5ff6dc6b@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_005853_797205_04D9E0EC 
X-CRM114-Status: GOOD (  23.96  )
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

On Wed, Dec 18, 2024 at 09:15:08AM -0800, Florian Fainelli wrote:
> On 12/18/24 03:37, Krzysztof Kozlowski wrote:
> > On Tue, Dec 17, 2024 at 11:44:38AM -0800, Florian Fainelli wrote:
> > > Document the revision c.1.5 compatible string that is present on newer
> > > Broadcom STB memory controllers (74165 and onwards).
> > > 
> > > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > > ---
> > >   .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml       | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
> > > index 4b072c879b02..99d79ccd1036 100644
> > > --- a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
> > > +++ b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
> > > @@ -29,6 +29,7 @@ properties:
> > >             - brcm,brcmstb-memc-ddr-rev-c.1.2
> > >             - brcm,brcmstb-memc-ddr-rev-c.1.3
> > >             - brcm,brcmstb-memc-ddr-rev-c.1.4
> > > +          - brcm,brcmstb-memc-ddr-rev-c.1.5
> > 
> > You should use v2.1 fallback and drop driver patch. Or explain in
> > commit briefly why different approach is suitable.
> 
> Are you suggesting that we should have fallback compatible strings, such
> that we have something like this:
> 
> compatible = "brcm,brcmstb-memc-ddr-rev-c.1.5",
> "brcm,brcmstb-memc-ddr-rev-c", "brcm,brcmstb-memc-ddr"
> 
> and the driver only needs to match on "brcm,brcmstb-memc-ddr-rev-c" and
> apply the adequate register offset table?

Almost, fallback should be brcm,brcmstb-memc-ddr-rev-b.2.1 or whatever
was in the driver first or whatever is the oldest known common
interface.

brcm,brcmstb-memc-ddr-rev-c is not a specific compatible.

> If so, that is not how the current binding, and therefore DTBs are being
> deployed, so that will introduce a breakage until we update all DTBs in the
> field...

No. First, I thought about new comaptible so the one you add here. No
breakage, it's new compatible. This saves you these pointless updates of
driver everytime you add new compatible.

Second, you can introduce fallbacks to older compatibles as well - there
will be no breakage, because you add one more compatible. The old
compatibles (covered by fallback) of course stays in the driver, so
there is no breakage at all. We did it multiple times for several
different bindings in Qualcomm. People were doing exactly the same:
adding compatible for new device to binding and driver, without
considering the compatibility at all.

Except being logically correct choice - using fallbacks - this really
has huge benefits when later upstreaming complete, big SoCs, like we do
for latest Qualcomm SoCs: several changes will be only bindings updates.

Best regards,
Krzysztof


