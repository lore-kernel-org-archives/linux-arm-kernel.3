Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53181C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 09:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3LCgJPF74Xbd9a4LK3HZnV1+d98aQdvtMSQTN4S4yY=; b=Mv3n5xVSnqLgJBQis35zTN9DvJ
	Blar/A3+J2lqpLZ//0lVpW6efpBDCobXqav+S8tbXTyGUHEpkFruWKGX97pWzDMlzdObNZshINtBZ
	urfI1rrBYX8qjYUjv/X2WjnWWlGTnqA27nHgUfYvVsmE0XHCavu176+BUvDI1oC/ylN2H4Lt1r2r0
	wyhubaN2VZ++7NHP2Nu8uemse7E6sRnGKf3/hTpuGci6cWIeWq/LEk9JJyoBXziR4dHge7ge4qNhx
	wol8F91H4bZwLZq6XFy9owOqMq4/FDzEhznSwU/zX/hIKGj8B9lwlc57UedkwqCNvMyismptIN17P
	qid28giQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8cC0-00000001pht-0Msk;
	Sat, 26 Apr 2025 09:51:28 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8cA7-00000001pZ7-0Qpj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 09:49:33 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1745660966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w3LCgJPF74Xbd9a4LK3HZnV1+d98aQdvtMSQTN4S4yY=;
	b=mL2Dr4PBjwgXUrKJj/AgVVRKSL5GmFbusKHF+A70PvEUaDDYfnu1lcLBih37M0FWhRTjSK
	vYJ9Vm4TF5gn53WfmmM/fR3Bw6Bu6dbDgYaLkhb5Gh3eZStC8TADhI9CrKfu5mwgpI9YfQ
	R8xX69n+r5XDJx9TYxayaqFF8zXg5A+zADwQ2njEyLmR+fJ3krEiHw8bFj8O/tiS4ojfvS
	TL/PL3CptmOq27C9PLh9muXvi7K8WoYfr/ytT5yvh9rT10WIgQc9ilZjUehgU60VtW4SV2
	JSGQvb7iVja5A61Cq0KkHqIe7dtE0RYSbcrDaKU14O0kVRjYwmMf7tRFRAMhQA==
Content-Type: multipart/signed;
 boundary=3f073c5a59fc125928ba9034ef05e53a7e470d8fbbe478b43f705ef13c24;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 26 Apr 2025 11:49:13 +0200
Message-Id: <D9GH5V09WW47.358SY1F7LJ9ZV@cknow.org>
Cc: <devicetree@vger.kernel.org>, <linux-pm@vger.kernel.org>, "Sebastian
 Reichel" <sebastian.reichel@collabora.com>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <kernel@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 5/7] thermal: rockchip: support reading trim values
 from OTP
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Jonas Karlman" <jonas@kwiboo.se>
References: <20250425-rk3576-tsadc-upstream-v5-0-0c840b99c30e@collabora.com>
 <20250425-rk3576-tsadc-upstream-v5-5-0c840b99c30e@collabora.com>
In-Reply-To: <20250425-rk3576-tsadc-upstream-v5-5-0c840b99c30e@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_024931_986126_9507CAF7 
X-CRM114-Status: GOOD (  25.06  )
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

--3f073c5a59fc125928ba9034ef05e53a7e470d8fbbe478b43f705ef13c24
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Nicolas,

On Fri Apr 25, 2025 at 9:34 PM CEST, Nicolas Frattaroli wrote:
> Many of the Rockchip SoCs support storing trim values for the sensors in
> factory programmable memory. These values specify a fixed offset from
> the sensor's returned temperature to get a more accurate picture of what
> temperature the silicon is actually at.
>
> The way this is implemented is with various OTP cells, which may be
> absent. There may both be whole-TSADC trim values, as well as per-sensor
> trim values.
>
> In the downstream driver, whole-chip trim values override the per-sensor
> trim values. This rewrite of the functionality changes the semantics to
> something I see as slightly more useful: allow the whole-chip trim
> values to serve as a fallback for lacking per-sensor trim values,
> instead of overriding already present sensor trim values.
>
> Additionally, the chip may specify an offset (trim_base, trim_base_frac)
> in degrees celsius and degrees decicelsius respectively which defines
> what the basis is from which the trim, if any, should be calculated
> from. By default, this is 30 degrees Celsius, but the chip can once
> again specify a different value through OTP cells.

Would it be useful to define all the values in the same unit?
Having celsius and decicelsius and millicelsius sounds like a recipe for
(future) off-by-10/-100/-1000 errors.

And possibly define-ing the '30' so people don't need this commit
message to figure out where that magic number comes from?
And also the '923' for ``.trim_slope``?

> The implementation of these trim calculations have been tested
> extensively on an RK3576, where it was confirmed to get rid of pesky 1.8
> degree Celsius offsets between certain sensors.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/thermal/rockchip_thermal.c | 221 +++++++++++++++++++++++++++++++=
++----
>  1 file changed, 202 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchi=
p_thermal.c
> index 89e3180667e2a8f0ef5542b0db4d9e19a21a24d3..3beff9b6fac3abe8948b56132=
b618ff1bed57217 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -9,6 +9,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> @@ -69,16 +70,18 @@ struct chip_tsadc_table {
>   * struct rockchip_tsadc_chip - hold the private data of tsadc chip
>   * @chn_offset: the channel offset of the first channel
>   * @chn_num: the channel number of tsadc chip
> - * @tshut_temp: the hardware-controlled shutdown temperature value
> + * @trim_slope: used to convert the trim code to a temperature in millic=
elsius
> + * @tshut_temp: the hardware-controlled shutdown temperature value, with=
 no trim

Having the same units used everywhere would also avoid possible
confusion here as ``trim_slope`` explicitly mentions millicelsius, but
``tshut_temp`` does not, but AFAIK it's also in millicelsius.

Cheers,
  Diederik

>   * @tshut_mode: the hardware-controlled shutdown mode (0:CRU 1:GPIO)
>   * @tshut_polarity: the hardware-controlled active polarity (0:LOW 1:HIG=
H)
>   * @initialize: SoC special initialize tsadc controller method
>   * @irq_ack: clear the interrupt
>   * @control: enable/disable method for the tsadc controller
> - * @get_temp: get the temperature
> + * @get_temp: get the raw temperature, unadjusted by trim
>   * @set_alarm_temp: set the high temperature interrupt
>   * @set_tshut_temp: set the hardware-controlled shutdown temperature
>   * @set_tshut_mode: set the hardware-controlled shutdown mode
> + * @get_trim_code: convert a hardware temperature code to one adjusted f=
or by trim
>   * @table: the chip-specific conversion table
>   */
>  struct rockchip_tsadc_chip {
> @@ -86,6 +89,9 @@ struct rockchip_tsadc_chip {

--3f073c5a59fc125928ba9034ef05e53a7e470d8fbbe478b43f705ef13c24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaAysHwAKCRDXblvOeH7b
btwyAP0TuDcK9Aa/VqKu9kTOU2O3d5xjx4EzW+e6XJ2ZOqBbGAEApqUGJ4a2zPpi
S1Shb4PtPJRr9dktGwogIP97AP7t3AY=
=e2Pn
-----END PGP SIGNATURE-----

--3f073c5a59fc125928ba9034ef05e53a7e470d8fbbe478b43f705ef13c24--

