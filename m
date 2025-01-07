Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FB1E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UflBXSWMuWN/RbLnr7BP15iY3OWBLuvZePkqlyr0FI=; b=PJkTCkZFd37pHJnY0qSwn+OgKb
	at2qTFrfmA6idmufpM6Sq9cmKxV8T7JfeYpDLA6oGLT8v5CQlV0t4Jr8ZJxQPBn5PotwVZjobaOnF
	8x2DxK6S1cOu4CEFRGnQ1diNhT7rBhWoIwUWhbWiUUrqUi5f3nUpCFC/Kj6kAYGQhwW93TvS/HqZO
	G6UMDgD9lvSfllPdmB9rlyrbubC37IdyHgcvbAeSAJoQllxAwC7zzbt1hW/45NU+HWhFWIo14dTd6
	QqxzDN8jWMdMqNK4xNw8eYnAu/KIuxWZ6uYJicJIL8tKfvUaXRR9qgMgu3Lk4HuOZLUiKlHeshkZ0
	7bKLzP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB3o-00000005Kyw-2veb;
	Tue, 07 Jan 2025 15:00:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAyp-00000005Jsb-21wa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:54:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 536511424;
	Tue,  7 Jan 2025 06:55:19 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5B7F3F673;
	Tue,  7 Jan 2025 06:54:48 -0800 (PST)
Date: Tue, 7 Jan 2025 14:54:46 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Add NetCube
 Systems Austria name
Message-ID: <20250107145446.16a8a4ea@donnerap.manchester.arm.com>
In-Reply-To: <20250106190703.4015-2-lukas.schmid@netcube.li>
References: <20250106190703.4015-1-lukas.schmid@netcube.li>
	<20250106190703.4015-2-lukas.schmid@netcube.li>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_065451_570507_8596F495 
X-CRM114-Status: GOOD (  19.31  )
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

On Mon,  6 Jan 2025 19:06:59 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

> NetCube Systems Austria builds Embedded Systems for use in IoT, IIoT,
> or Smart Home scenarios.
> 
> Website is still WIP, but the Links on it are active:
> https://netcubesystems.at/
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

Just to give some more guidance on when to drop tags and when to not:
If you are making real changes to the code, then it might be indicated to
drop the tag, since the patch might not be anymore what the reviewer
acknowledged.
But if you are just fixing (especially improving/adding to) the commit
message, or fixing some typo, then you keep the tag, to reduce the churn
and avoid extra work again from the reviewer.
This is sometimes not easy to decide, say for instance: is renaming a
variable something covered by the tag? The new name might be worse or
misleading, even though the code didn't really change.

But in this case it's pretty clear that Krzysztof is surely fine with you
adding extra info to the commit message, and the actual patch didn't
change at all, so keeping his tag would be a good thing.

If you are in doubt, then it's often good to drop the tag *and* point this
out, for instance in the cover letter, like: "Krzysztof, I changed this
and that in patch 1/4, so I dropped your tag."

Cheers,
Andre

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index da01616802c7..a30ed9547098 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1027,6 +1027,8 @@ patternProperties:
>      description: Neofidelity Inc.
>    "^neonode,.*":
>      description: Neonode Inc.
> +  "^netcube,.*":
> +    description: NetCube Systems Austria
>    "^netgear,.*":
>      description: NETGEAR
>    "^netlogic,.*":


