Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBC7C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 09:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFNrF1+QCqXJYQ2BxaXDZ6u0WsATr1kvUb16OTMEuz4=; b=tUikQtOjnhDT7Hn1JfsOJ8dXYl
	bBQ8gVq0wsSKYY6iE+ZU+FIdKi6HPCXdpPBG3EESnROCYXpoC+N5QQrDcOLIiIPiPplgsqFUm7Yar
	iCGclqgYTw9yCMC4fLW3Do8DIQJQQYwImdEDAAaUTaeYN+mqbrenhT7pJ+13mP4SV0asM1BJ+JxVs
	dI7uVn770UDjNTLwo504Z12qvt7cnVImEIsdKn/vTFXx+Rf0+XatLm364WvEdbKVEEPVvX7DeZShL
	eeKxheEGURfukvwbr11zWCm2xc1K8uaHMXS6EpUvPtsQavCau3nClp0+qXEsaQ+w2JaiR7GxC2eey
	FmUAgYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tweLq-00000002kYj-45bJ;
	Mon, 24 Mar 2025 09:44:10 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tweEs-00000002jXI-0Cn3;
	Mon, 24 Mar 2025 09:36:59 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1742809015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kFNrF1+QCqXJYQ2BxaXDZ6u0WsATr1kvUb16OTMEuz4=;
	b=EvPCPcEvEphlFm4vzCrED3mmJuyz5P3exj1vtXKjA5BDHBcTewltFvy66o4BOPEX8mz0kY
	rhEnfkbWToQg4L6QoDMvFRXwoTUGWwFn3deRY3BC2HrRqSzWS/u0M8ihvbzaM83vloTDjl
	+JfonB2rs1O5tFvPmSfj+u9sakL0xAzFBFWbLjeXqS9dnjSCDI1zzr2iBoUBnMiUxsIyYv
	SH3ITh28J/6HXzUkm3kEbDjz7JXTjKN3ENv4wf/cHFv5ptAyFgvQvDgHa7iYHJrSxCei5s
	aqFPjayZCyGU+6SsUlQox67BonrIV7Vwoa3eO0ZKvuaO+7aFoJl63rn68lV3Fg==
Date: Mon, 24 Mar 2025 10:36:54 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, stable@vger.kernel.org, Alexey Charkov
 <alchark@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Remove overdrive-mode OPPs from
 RK3588J SoC dtsi
In-Reply-To: <960c038ad9f7b83fe14d0ded388b42f7@manjaro.org>
References: <f929da061de35925ea591c969f985430e23c4a7e.1742526811.git.dsimic@manjaro.org>
 <71b7c81b-6a4e-442b-a661-04d63639962a@cherry.de>
 <960c038ad9f7b83fe14d0ded388b42f7@manjaro.org>
Message-ID: <460503eb831485ede9a49dcf226aef1b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_023658_321319_E6E36257 
X-CRM114-Status: UNSURE (   9.99  )
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

Hello Quentin,

On 2025-03-23 11:19, Dragan Simic wrote:
> On 2025-03-21 10:53, Quentin Schulz wrote:
>> On 3/21/25 4:28 AM, Dragan Simic wrote:
>>> The differences in the vendor-approved CPU and GPU OPPs for the 
>>> standard
>>> Rockchip RK3588 variant [1] and the industrial Rockchip RK3588J 
>>> variant [2]
>>> come from the latter, presumably, supporting an extended temperature 
>>> range
>>> that's usually associated with industrial applications, despite the 
>>> two SoC
>>> variant datasheets specifying the same upper limit for the allowed 
>>> ambient
>>> temperature for both variants.  However, the lower temperature limit 
>>> is
>> 
>> RK3588 is rated for 0-80°C, RK3588J for -40-85°C, c.f. Recommended
>> Operating Conditions, Table 3-2, Ambient Operating Temperature.
> 
> Indeed, which is why I specifically wrote "specifying the same upper
> limit", because having a lower negative temperature limit could hardly
> put the RK3588J in danger of overheating or running hotter. :)

Oh, now I see what you actually wrote above, which I misread a bit
initially...  In fact, the upper ambient temperature limit is the
same for both RK3588J and RK3588, according to the datasheets;  it's
just that the lower temperature limit is much lower for the RK3588J,
which the patch description says.

I'm not sure where did you find the 80 vs. 85 oC difference;  please,
see a couple of screenshots from the datasheets, linked below:

- RK3588 datasheet v1.6 (v1.7 is the same): https://0x0.st/8j1a.png
- RK3588J datasheet v1.1: https://0x0.st/8j1m.png

The v2 of the patch is coming soon, with the patch description improved
according to your suggestions.

