Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3D3CFC29A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 18:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnLoWmzcbBo5mJfvaJC8hJpQz/bxpIrAkfQB9+Sm5zs=; b=WbJbGA93RSuPK1u8PXngWbXAWk
	X2ZeHCFx6XIrRgwcsccbemuS7O8BQ9/0IHF4HEZz/WBhJ7nw0eUgmsmVV2Ufm7U4tgjoWfuL/opdh
	/Ljz9agjX5wgtnX8DGuRkszd+iUKoAjfnzPCqz8U/piJ3fJKvSVcT4UxZ4sgRLw7WWMjA//25X8lt
	M0APnBa7rJxW0aqjXNVlUtqHBcVTJXZzusTMPhao4gBcfQfRBqUFkYA6esFkmODFpimnfACwnNAZ9
	C2e2Qlpu7vUtj5UNOY+vPuedFN1D18P1w8JKaqf+Zb6PlU46CUWC/jDBwvCIgE2RWdyU7HecUpCXQ
	a18ZJPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVXp-00000008pmo-2B5S;
	Fri, 21 Nov 2025 18:07:41 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVXm-00000008ple-3WAQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 18:07:40 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dCjqH5JC5z9vB1;
	Fri, 21 Nov 2025 19:07:23 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=linux@timmermann.space
Date: Fri, 21 Nov 2025 19:07:20 +0100
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Marquet <tb@a-marquet.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ARM: samsung: Add Samsung Manta (Google
 Nexus 10)
Message-ID: <3phpqlnzbqoclx6zqkqymugzgazg3xtxrmvl3coflgos4ncwf4@ljo4zpgyp7vh>
References: <20251120144018.961604-1-linux@timmermann.space>
 <20251120144018.961604-2-linux@timmermann.space>
 <20251121-convivial-wren-of-wind-cefe21@kuoka>
 <zgyxb6jqfvfr6iah4lw7rvweextbwxrtlysap4dfzeejqgulwo@ik25opshvwxd>
 <a75675ef-dff6-4f97-854e-a007d289c45d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a75675ef-dff6-4f97-854e-a007d289c45d@kernel.org>
X-Rspamd-Queue-Id: 4dCjqH5JC5z9vB1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_100739_021954_AC33D7CE 
X-CRM114-Status: GOOD (  23.54  )
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

On Fri, Nov 21, 2025 at 06:24:36PM +0100, Krzysztof Kozlowski wrote:
> On 21/11/2025 14:45, Lukas Timmermann wrote:
> > On Fri, Nov 21, 2025 at 10:04:43AM +0100, Krzysztof Kozlowski wrote:
> >> On Thu, Nov 20, 2025 at 03:40:14PM +0100, Lukas Timmermann wrote:
> >>> From: Alexandre Marquet <tb@a-marquet.fr>
> >>>
> >>> Add the Google Nexus 10 board to documentation.
> >>>
> >>> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> >>> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> >>> ---
> >>>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> index f8e20e602c20..97a5a678f43c 100644
> >>> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> @@ -120,6 +120,7 @@ properties:
> >>>                - google,snow-rev5                # Google Snow Rev 5+
> >>>                - google,spring                   # Google Spring
> >>>                - insignal,arndale                # Insignal Arndale
> >>> +              - samsung,nexus10-manta           # Samsung Manta (Google Nexus 10)
> >>
> >> Google Nexus or Samsung Nexus or Samsung Manta? I am sorry, but I am
> >> 100% sure that Samsung and Google are two different companies. Google
> >> products use only google prefixes, see all other Google devices.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > Google sold the device under it's Nexus brand. But it was built by
> > Samsung, not just it's SoC. It's codename is "manta". Google places it 
> > in the Samsung directory instead of their own.
> > See: https://android.googlesource.com/device/samsung/manta/
> > It is a Samsung board, but also a Google device.
> 
> As I said, all Google end-user made by Samsung have Google names, not
> Samsung. Do you see there samsung,spring? Or samsung,nexus for other
> Nexuses? No.
> 
> There is just no such thing as samsung,nexus. Never was, so you cannot
> use that as product.
> 
> Best regards,
> Krzysztof
> 
I compared some Pixel and Nexus devices and now understand what you
meant. So "google,manta" should be the correct name here?
As seen in "google,sargo" -> Google Pixel 3a
Thanks for your input.

Best regards,
Lukas Timmermann

