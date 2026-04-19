Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FBAEA71AC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 21:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/mXJHknI/Sa3DbGR99q1+bAXXzMNatWzJ0THO/mEWw=; b=OwaCLVXKNEC6Cp31S8QL4uLNhJ
	Mti8jYEICxIO7Yo9QE3eiRcenrTLYFVROorboEDop5mLUSdQtf7TKB0lGipGNOLc8ZLOGbqJbaT0K
	UpHQb5UheOaYmoUqgwmwLgHbuyiPNU3jJbIM4QRw+9dtTveYS93Zhte+XhylpckMpeaEU2m/tT0uO
	f9s3u307Nj3aXJExqBRs4FEGH0diNtqxqIiLARE2VbdLENdVpZkZDhEa1A9RjzApArWo+rWAT/QzT
	h6q/pXZtzS1hbwHXDTR86GGjsMx+AvjSsA5pNQ0aTpHy2j1BXSikfbV5S+rIz6qLfj1xRgtZYsefZ
	s+mm9FfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZaa-000000065xq-21vK;
	Sun, 19 Apr 2026 21:22:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZaX-000000065xW-3upU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 21:21:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DD6C1596;
	Sun, 19 Apr 2026 14:21:49 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D9883F7B4;
	Sun, 19 Apr 2026 14:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776633715; bh=KPDKCHePwqXGiufNS/KL+heUjt/2gtc+Vw6iiDD5x5U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Svdigpoj90VsDGdlirxxFGIzJMo1HY+I6n8tz/RQ8JbZ0L/bOWIOPlor9KPwlEmht
	 mWQffKc7qNhaCrrNJfrVSZsE8ql2pJ8BbcCuYMf+1Ef7Dr3EZRQW/HoxsUDPyG0vuB
	 TEwdGaSnsbEcv3+SYz70jzPKXS2REMSW2hpEX1ss=
Date: Sun, 19 Apr 2026 23:21:27 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/4] dt-bindings: timer: allwinner,sun5i-a13-hstimer:
 add H616 and T113-S3
Message-ID: <20260419232127.39e5f43a@ryzen.lan>
In-Reply-To: <20260419-h616-t113s-hstimer-v1-1-1af74ebef7c5@mmpsystems.pl>
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
	<20260419-h616-t113s-hstimer-v1-1-1af74ebef7c5@mmpsystems.pl>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_142158_148567_D3AC0699 
X-CRM114-Status: GOOD (  18.77  )
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

On Sun, 19 Apr 2026 14:46:07 +0200
Michal Piekos <michal.piekos@mmpsystems.pl> wrote:

> H616 is compatible with the existing sun5i binding, but
> require its own compatible string to differentiate register offsets.

Just a nit: if the register offsets are different, then it's not
compatible, not even with the binding. So just say something like "they
are similar, but with different register offsets".

> T113-S3 uses same offsets as H616.

So it looks like (somewhat naturally) this is true for D1 as well? And
since that SoC was the first, we use "sun20i-d1" as the compatible
string prefix for this SoC's devices. I think we should follow suit
here and name that similarly.

> 
> Add allwinner,sun50i-h616-hstimer
> Add allwinner,sun8i-t113s-hstimer with fallback to
> allwinner,sun50i-h616-hstimer
> Extend schema condition for interrupts to cover H616 compatible variant.
> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  .../devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml    | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
> index f1853daec2f9..bb60a85dc34b 100644
> --- a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
> +++ b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
> @@ -15,9 +15,13 @@ properties:
>      oneOf:
>        - const: allwinner,sun5i-a13-hstimer
>        - const: allwinner,sun7i-a20-hstimer
> +      - const: allwinner,sun50i-h616-hstimer
>        - items:
>            - const: allwinner,sun6i-a31-hstimer
>            - const: allwinner,sun7i-a20-hstimer
> +      - items:
> +          - const: allwinner,sun8i-t113s-hstimer
> +          - const: allwinner,sun50i-h616-hstimer
>  
>    reg:
>      maxItems: 1
> @@ -45,7 +49,9 @@ required:
>  if:
>    properties:
>      compatible:
> -      const: allwinner,sun5i-a13-hstimer
> +      enum:
> +        - allwinner,sun5i-a13-hstimer
> +        - allwinner,sun50i-h616-hstimer

IIUC this just matches the H616, but wouldn't match the T113/D1? And
there is some construct with "contains" to match for fallback
compatibles?

Cheers,
Andre
>  
>  then:
>    properties:
> 


