Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FC1CFC279
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 13:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2U8HTZAzVu4cRctJcvjednyNqfk54zNmfcQSPaDQWM=; b=CkaT/NdVQlKzgjx6U71FJ4trPv
	TiU263Ywfri7gH6D8R1sifZrK2Ku1hjS2E6sQWEwRPayN82ZHrsOeTyjdM3XXXTmScQXgLdYZJavX
	DV8aMVAnrDYBlqi4wAm5i6L6RYXd0icgW43FsarUEi/QlGNN1vVBdgbFKQH315rZmbhoHXDB58ccB
	S+HwbcB15Y1egNhNJP1woHzlwDHtw0+XvpucDLI7S2bWoFvVSDFt2vZwjRYmW6oHAda2wh2FTeN5i
	I7+z0i+6NbL5T0wgdXGWwgMRctIN0oRo2c7KjDx96RXMItZyTqeCDW8LDPT9V9sGdBnw1WAoVfyKj
	bzGxcYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRS8-00000008RWC-2xss;
	Fri, 21 Nov 2025 13:45:32 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRS6-00000008RUz-015N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 13:45:31 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dCc112TK1z9tKs;
	Fri, 21 Nov 2025 14:45:25 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=linux@timmermann.space
Date: Fri, 21 Nov 2025 14:45:20 +0100
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Marquet <tb@a-marquet.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ARM: samsung: Add Samsung Manta (Google
 Nexus 10)
Message-ID: <zgyxb6jqfvfr6iah4lw7rvweextbwxrtlysap4dfzeejqgulwo@ik25opshvwxd>
References: <20251120144018.961604-1-linux@timmermann.space>
 <20251120144018.961604-2-linux@timmermann.space>
 <20251121-convivial-wren-of-wind-cefe21@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-convivial-wren-of-wind-cefe21@kuoka>
X-Rspamd-Queue-Id: 4dCc112TK1z9tKs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_054530_186556_984EEDB0 
X-CRM114-Status: GOOD (  17.25  )
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

On Fri, Nov 21, 2025 at 10:04:43AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Nov 20, 2025 at 03:40:14PM +0100, Lukas Timmermann wrote:
> > From: Alexandre Marquet <tb@a-marquet.fr>
> > 
> > Add the Google Nexus 10 board to documentation.
> > 
> > Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > ---
> >  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> > index f8e20e602c20..97a5a678f43c 100644
> > --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> > +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> > @@ -120,6 +120,7 @@ properties:
> >                - google,snow-rev5                # Google Snow Rev 5+
> >                - google,spring                   # Google Spring
> >                - insignal,arndale                # Insignal Arndale
> > +              - samsung,nexus10-manta           # Samsung Manta (Google Nexus 10)
> 
> Google Nexus or Samsung Nexus or Samsung Manta? I am sorry, but I am
> 100% sure that Samsung and Google are two different companies. Google
> products use only google prefixes, see all other Google devices.
> 
> Best regards,
> Krzysztof
> 
Google sold the device under it's Nexus brand. But it was built by
Samsung, not just it's SoC. It's codename is "manta". Google places it 
in the Samsung directory instead of their own.
See: https://android.googlesource.com/device/samsung/manta/
It is a Samsung board, but also a Google device.

Best regards,
Lukas Timmermann

