Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BFE606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3p9O6hrJ;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DC6WunDL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+ZDZrqj/BPoTA6v4mR/qLoQhcDV/UIjpuvoi1Z0zPGQ=; b=3p9O6hrJkzrspNwEkVjCNaPg1C
	i98jMQv7iZAEqj1Yv+0Z3Fem6uWlBhNdnYH/eJwVuH7gDSFx8K5m9ypRMvyVLyI9fcDQpbLiAGM4G
	hIkOlzkkjyydpKLABKnbjNecBbLfYf8xPcXZTG7tFd2RS4RzIoIqU8uJZ6Zpc7mgrEXfJbQp4iust
	H2edTPenVI76cWlPxIUPwiXTaDvvGCR4dWWqD9x1upzcS89yB7rFEusdhMPH0Jn0gyOP1KK8ujMJm
	4xxKUpcKuktlr3bpDiXDHq+Rd0kDjB4vcDosR2XgcFVXzgBWa0VFZZdmVjUOJAHlrb8bKXfA2MQDe
	DwPHRoDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3it-000000073tv-0QrU;
	Wed, 28 Oct 2026 13:29:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3iq-000000073sk-1T7I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:29:46 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE3C034;
	Wed, 28 Oct 2026 14:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793194046;
	bh=8cQ5CvO/2sA2dQUmqeKVIlmOQmp+Y7f2f6c5x7Y+SrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DC6WunDLJngl6a5oLdyhXtOxCbeD47TRHBYXKqGadYb+KVLYJL2wFP2W9sAuwBbuT
	 0ZrOdBnemjOFetphtsckixYkVX7RFSmvWk02kL7PZ8kp0LZj+sCKS0v9q3bHzCknIv
	 9SbqSAWUkTebMzav3ZRtsAa7t8pR/VLI8J3bBbRI=
Date: Wed, 28 Oct 2026 15:29:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 07/11] dt-bindings: clock: renesas,r8a78000-cpg: Add PWM
 clocks
Message-ID: <20261028132937.GL15441@killaraus.ideasonboard.com>
References: <cover.1793026273.git.geert+renesas@glider.be>
 <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_062944_847757_EE7D869A 
X-CRM114-Status: GOOD (  16.76  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Geert,

Thank you for the patch.

On Mon, Oct 26, 2026 at 03:55:23PM +0100, Geert Uytterhoeven wrote:
> Add definitions for the clocks used by the PWM modules on R-Car X5H:
>  - R8A78000_CPG_SGASYNCD16_PERW_MAIN,
>  - R8A78000_CPG_S0ASYNCD8_PERW_MAIN.
> Include R8A78000_CPG_SGASYNCD8_PERW_MAIN for ordering consistency.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This depends on "[PATCH 2/7] dt-bindings: clock: renesas,r8a78000-cpg:
> Add GPIO clocks"
> https://lore.kernel.org/624a9fb09e4ec74b1995797e5121b86e7206f5f2.1792776697.git.geert+renesas@glider.be
> ---
>  include/dt-bindings/clock/renesas,r8a78000-cpg.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/renesas,r8a78000-cpg.h b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> index cd7192ccecd4e22c..8c30476d41448cf5 100644
> --- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> +++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> @@ -28,5 +28,8 @@
>  #define R8A78000_CPG_SGD8_PERW_BUS		18
>  #define R8A78000_CPG_SGD32_PERW_BUS		19
>  #define R8A78000_CPG_S0D24_HSCN_OTHER		20
> +#define R8A78000_CPG_SGASYNCD8_PERW_MAIN	21
> +#define R8A78000_CPG_SGASYNCD16_PERW_MAIN	22

Could you also add R8A78000_CPG_SGASYNCD4_PERW_MAIN and
R8A78000_CPG_SGASYNCD32_PERW_MAIN for ordering consistency ? The
dependency patch should then also include R8A78000_CPG_SGD4_PERW_BUS and
R8A78000_CPG_SGD16_PERW_BUS, as well as
R8A78000_CPG_S0D{1,2,4,8,12,16}_HSCN_OTHER.

> +#define R8A78000_CPG_S0ASYNCD8_PERW_MAIN	23
>  
>  #endif /* __DT_BINDINGS_CLOCK_RENESAS_R8A78000_CPG_H__ */

-- 
Regards,

Laurent Pinchart

