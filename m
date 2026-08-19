Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8831EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 22:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/B6tPYN5LCOlrm1Ya2eKp2YLySXslAme9Vq9iWjNY+I=; b=ZcdPRlfMDyWdWMFqQzRLRwGCEJ
	476vdWQAp5JMYh79YldsIp9b+vKJZyFhnd5c/W3t5yLb/2VA2c0seZe85OQ+9KH3CiwRdQy2WRFLS
	Pg3//i0Hr6I+fhnK3Bk1ZhZH6JFHwnhZpw7NI/luL3SZc6nUFW7qpWicwKn26N7HzE1AAz9PyiWyg
	UBg0Eo86YNC1HBierYJwL64XELq1Ur7Wh5CYKiZ69dTF0j8JAKF6BDF0vK9hdRq5XJwYn8U+NzDAm
	HnhWQ3IN82rmjXv0vPXNb+K1lfHsW6wO9JWZTO4H6DyVQlyezULXHO7ls6PDQFUKhbKHdkoEFjxxO
	DIZk1q/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwoeb-0000000AbTG-1S9A;
	Wed, 19 Aug 2026 22:21:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwoeX-0000000AbSc-2lnB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 22:21:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 97BBC4E412DF;
	Wed, 19 Aug 2026 22:20:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 501F25FF42;
	Wed, 19 Aug 2026 22:20:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26DC711C75BF8;
	Thu, 20 Aug 2026 00:20:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787178047; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=/B6tPYN5LCOlrm1Ya2eKp2YLySXslAme9Vq9iWjNY+I=;
	b=pN/znz8lKHXV/fLNj/PjtYdM9DGj/bz3dKhueioERvvYfFpjXdeG/3eczqJaZihqWNsasl
	yp9p4+pdZNUj27FpapGOXrbxg1ebxiettOkMEagwrVjz6VBqr4BWfvdtUt+zayb+EL5f12
	bZWOVH9hPVTCiF/Vj3HmyyGHGDPrN8j+kTAp28SE+YvEQU9wchjwHtGl8pLdCfSPvfYPw7
	CeI8vaXlksUW5wURrrOTHOH8kEMABcoODvJg6ZvG92ZUdzfGyu0wjTm5vUjR5YVWs8NMf9
	zu8PDWxgPJe6Q3ESqU0MPjXk6pkDjbO+W70j2XuV/TnIKe65gLa9cLWX4s02EQ==
Date: Thu, 20 Aug 2026 00:20:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Langer <michael.brainbug.langer@googlemail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/6] rtc: s35390a: force 24-hour mode
Message-ID: <202608192220436c9c7207@mail.local>
References: <20260820-rtc_s35390a_int1-v5-0-5eb4ef85c6a9@posteo.de>
 <20260820-rtc_s35390a_int1-v5-4-5eb4ef85c6a9@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-rtc_s35390a_int1-v5-4-5eb4ef85c6a9@posteo.de>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_152058_000049_2524CA7F 
X-CRM114-Status: GOOD (  26.28  )
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

On 19/08/2026 22:05:56+0000, Markus Probst wrote:
> Instead of trying to remember the current 12/24-hour mode, which could
> result in time corruption if out of sync, we force the use of the 24-hour
> mode. Set to 24-hour mode if in 12-hour mode on startup and assume
> 24-hour mode. The 24-hour mode is already forced on reset.
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  drivers/rtc/rtc-s35390a.c | 67 +++++++++++++++++++++--------------------------
>  1 file changed, 30 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
> index 575bb256eb25..b34a3f7e8476 100644
> --- a/drivers/rtc/rtc-s35390a.c
> +++ b/drivers/rtc/rtc-s35390a.c
> @@ -64,7 +64,6 @@ MODULE_DEVICE_TABLE(of, s35390a_of_match);
>  
>  struct s35390a {
>  	struct i2c_client *client[8];
> -	int twentyfourhour;
>  };
>  
>  static int s35390a_set_reg(struct s35390a *s35390a, int reg, u8  *buf, int len)
> @@ -181,31 +180,6 @@ static int s35390a_disable_test_mode(struct s35390a *s35390a)
>  	return s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, buf, sizeof(buf));
>  }
>  
> -static char s35390a_hr2reg(struct s35390a *s35390a, int hour)
> -{
> -	if (s35390a->twentyfourhour)
> -		return bin2bcd(hour);
> -
> -	if (hour < 12)
> -		return bin2bcd(hour);
> -
> -	return 0x40 | bin2bcd(hour - 12);
> -}
> -
> -static int s35390a_reg2hr(struct s35390a *s35390a, char reg)
> -{
> -	unsigned hour;
> -
> -	if (s35390a->twentyfourhour)
> -		return bcd2bin(reg & 0x3f);
> -
> -	hour = bcd2bin(reg & 0x3f);
> -	if (reg & 0x40)
> -		hour += 12;
> -
> -	return hour;
> -}
> -
>  static int s35390a_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> @@ -225,7 +199,7 @@ static int s35390a_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	buf[S35390A_BYTE_MONTH] = bin2bcd(tm->tm_mon + 1);
>  	buf[S35390A_BYTE_DAY] = bin2bcd(tm->tm_mday);
>  	buf[S35390A_BYTE_WDAY] = bin2bcd(tm->tm_wday);
> -	buf[S35390A_BYTE_HOURS] = s35390a_hr2reg(s35390a, tm->tm_hour);
> +	buf[S35390A_BYTE_HOURS] = bin2bcd(tm->tm_hour);
>  	buf[S35390A_BYTE_MINS] = bin2bcd(tm->tm_min);
>  	buf[S35390A_BYTE_SECS] = bin2bcd(tm->tm_sec);
>  
> @@ -256,7 +230,7 @@ static int s35390a_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  
>  	tm->tm_sec = bcd2bin(buf[S35390A_BYTE_SECS]);
>  	tm->tm_min = bcd2bin(buf[S35390A_BYTE_MINS]);
> -	tm->tm_hour = s35390a_reg2hr(s35390a, buf[S35390A_BYTE_HOURS]);
> +	tm->tm_hour = bcd2bin(buf[S35390A_BYTE_HOURS] & 0x3f);
>  	tm->tm_wday = bcd2bin(buf[S35390A_BYTE_WDAY]);
>  	tm->tm_mday = bcd2bin(buf[S35390A_BYTE_DAY]);
>  	tm->tm_mon = bcd2bin(buf[S35390A_BYTE_MONTH]) - 1;
> @@ -325,8 +299,7 @@ static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
>  	else
>  		buf[S35390A_ALRM_BYTE_WDAY] = 0;
>  
> -	buf[S35390A_ALRM_BYTE_HOURS] = s35390a_hr2reg(s35390a,
> -			alm->time.tm_hour) | 0x80;
> +	buf[S35390A_ALRM_BYTE_HOURS] = bin2bcd(alm->time.tm_hour) | 0x80;
>  	buf[S35390A_ALRM_BYTE_MINS] = bin2bcd(alm->time.tm_min) | 0x80;
>  
>  	if (alm->time.tm_hour >= 12)
> @@ -381,8 +354,7 @@ static int s35390a_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
>  
>  	if (buf[S35390A_ALRM_BYTE_HOURS] & 0x80)
>  		alm->time.tm_hour =
> -			s35390a_reg2hr(s35390a,
> -				       buf[S35390A_ALRM_BYTE_HOURS] & ~0x80);
> +			bcd2bin(buf[S35390A_ALRM_BYTE_HOURS] & 0x3f);
>  
>  	if (buf[S35390A_ALRM_BYTE_MINS] & 0x80)
>  		alm->time.tm_min = bcd2bin(buf[S35390A_ALRM_BYTE_MINS] & ~0x80);
> @@ -459,7 +431,7 @@ static int s35390a_probe(struct i2c_client *client)
>  	unsigned int i;
>  	struct s35390a *s35390a;
>  	struct rtc_device *rtc;
> -	u8 buf, status1;
> +	u8 buf, status1, time[7];
>  	struct device *dev = &client->dev;
>  	struct nvmem_config nvmem_cfg = {
>  		.name = "s35390a_nvram",
> @@ -503,10 +475,31 @@ static int s35390a_probe(struct i2c_client *client)
>  		return err_read;
>  	}
>  
> -	if (status1 & S35390A_FLAG_24H)
> -		s35390a->twentyfourhour = 1;
> -	else
> -		s35390a->twentyfourhour = 0;
> +	if (!(status1 & S35390A_FLAG_24H) && err_read != 1) {
> +		unsigned int hour;
> +
> +		status1 |= S35390A_FLAG_24H;
> +
> +		err = s35390a_get_reg(s35390a, S35390A_CMD_TIME1, time, sizeof(time));
> +		if (err < 0)
> +			return dev_err_probe(dev, err, "reading 12-hour time failed\n");
> +
> +		/* converting to 24-hour time */
> +		time[S35390A_BYTE_HOURS] = bitrev8(time[S35390A_BYTE_HOURS]);
> +		hour = bcd2bin(time[S35390A_BYTE_HOURS] & 0x3f);
> +		if (time[S35390A_BYTE_HOURS] & 0x40)
> +			hour += 12;
> +
> +		time[S35390A_BYTE_HOURS] = bitrev8(bin2bcd(hour));
> +
> +		err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS1, &status1, sizeof(status1));
> +		if (err < 0)
> +			return dev_err_probe(dev, err, "setting 24-hour mode failed\n");
> +
> +		err = s35390a_set_reg(s35390a, S35390A_CMD_TIME1, time, sizeof(time));
> +		if (err < 0)
> +			return dev_err_probe(dev, err, "setting 24-hour time failed\n");

No, don't do this, this will break existing users as your conversion may
happen after a minute rollover. The only function in which you are
allowed to change the time registers is set_time. You definitively need
to be able to read 12H mode time but you are allowed to only support
writing 24h time.

Also, this is super verbose, adding strings to the kernel makes it
bloated.

To avoid any desync, simply test for the S35390A_FLAG_24H bit in status
in s35390a_rtc_read_time as the register is already read anyway.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

