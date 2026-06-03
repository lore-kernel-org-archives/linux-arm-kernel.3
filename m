Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EF3CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 05:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC3XDE9iW2LOEDhY1DKEeGQfC1ZNCr3OBgvoMZPVQVk=; b=eY8+NCedz3csVeUcMMW7hqIm6f
	qU+Z6shylUImRWRNwrdN6kdSAW9jfMfDJA5rGvH/2EzzVdoapPER+FbV4hfvti6vpIZqATAENrPvY
	/2fctHBIqiUaZ1jQYkYtBykYPxKKRWCn+Opkd30FFzWRAbG6+BDbmVww/QR1QohsdN4N/Mz7aXyOq
	avZEwhCEMCNBLOs9mozOx3s1O3nt1we1yCsrBW+AivuyN5tU0TtJ6krhonU7U6lxaJUiZhCOLJ7Xt
	7NZKZU9mDDOihnGRa05AOSD0T7LnIIs81uwImcwdTvv2CVEqK829DQlV5SNBnILy4oyXN8QXWFRs/
	nCI/kKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeHn-0000000EIK1-0ina;
	Wed, 03 Jun 2026 05:37:03 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeHk-0000000EIJb-1HHu;
	Wed, 03 Jun 2026 05:37:02 +0000
Message-ID: <3f94dc8c-82fc-4941-bb16-408d01da5280@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1780465013;
	bh=hi6gNubcDNseMOAElaWu/w1hNneeIoZV+WFrRdpCF9s=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=qtoo+ItVSgx3QVaOmiMHqXPvOKNpzvlJ0ZuCigrvHBUv1h+AZMT853NV33ZVXw2vw
	 AcVvpEKC0aPhU+PlxtixDUbN1/gTPRoS9WAWgoez+tm/pFDFRS9iwtxOgD2y7NT11E
	 2ceszJZ7Uqs4w/amue08R5U29pZjO2nhRU49+ThA=
Date: Wed, 3 Jun 2026 07:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v3] thermal: amlogic: add missing dependency on MESON_SM
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, kernel test robot <lkp@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>
References: <20260602-fix-missing-meson_sm-symbol-v3-1-6f7f69cd7d6c@aliel.fr>
 <f5118303-d7ea-402e-84d6-794d6860f992@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f5118303-d7ea-402e-84d6-794d6860f992@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_223700_807481_BBEE8090 
X-CRM114-Status: UNSURE (   8.05  )
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

On 6/2/26 11:08 PM, Daniel Lezcano wrote:
> On 6/2/26 16:19, Ronald Claveau via B4 Relay wrote:
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> The amlogic thermal driver calls meson_sm_get() and
>> meson_sm_get_thermal_calib() which are exported by the meson_sm
>> driver. Without CONFIG_MESON_SM enabled, the build fails with
>> undefined references to these symbols.
>>
>> Add a proper Kconfig dependency on MESON_SM instead of relying on
>> stub functions, which makes the dependency explicit and prevents
>> invalid configurations.
>>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202605291530.en7aGn7w-
>> lkp@intel.com/
>> Reported-by: Mark Brown <broonie@kernel.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
> 
> Applied, thanks

Thank you.
I think it will need a reorder for bisect to be ok btw.
It needs to come before b21d88de6918 ("thermal/drivers/amlogic: Add
support for secure monitor calibration readout")

-- 
Best regards,
Ronald

