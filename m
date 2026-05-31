Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B84CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otpTnBLn4gRxV6ttBmbJsOdpluNyfeULjgffsXkooSg=; b=aBx7XvGYSdxJ/0MuPyzmtGtLOZ
	CSQd35RRKJBKOE3FXcaPRFSjSfvKJm11twoZ1sbRph7RU9PO0aIpfWz4Wk+AZ57oMc2OBs+fMLz1c
	igzFZqwHs8MymAZBFqCNAik8ASBgPSzwLnXufrzzbUCkeecu7VZV5BcMUxQ11eKnr7GqczPuctwJX
	8+8ze2AWlid2CFcAfpbq2BRnuyfHyFwVbkxYXRoYKum5cs0C3w7RSNSKzVEn5ntm8HTBoTxq0S58b
	hOQNt1cLVvKjnawWHM5E37M/lHV/WqCH/qfcNU1f17VD9JSty3EQ+ZOAGVA4xgds7mbkDgIVMVy4l
	Yd2crvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTkIo-00000009npy-1X92;
	Sun, 31 May 2026 17:50:22 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTkIl-00000009npN-2EUF;
	Sun, 31 May 2026 17:50:21 +0000
Message-ID: <12d74340-0213-4f7e-a494-10ce147844ad@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1780249805;
	bh=JQpEJWohU7u2PUrSQq5dK/MO03Qv9YI8notJ93T8T3k=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=oJVEYD73f39ZQ8iUe8tM1mLjjbNxz4Aw2wpFEEW4h+E5It9PvmKzmqKDYSgM8dRCW
	 QmdyKnjKhbFuzVWjJHlmL4/ekhXpHSz8AXid6Fwhnpo5Iw5p+qp91UmNnJKACqV0KD
	 nK/0i3YsiVZdmB2M/Yy7X0I6YpjPuYYVPFIVp+C0=
Date: Sun, 31 May 2026 19:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2] firmware: meson: sm: add stub functions when
 CONFIG_MESON_SM is disabled
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
References: <20260531-fix-missing-meson_sm-symbol-v2-1-1def8c3c169f@aliel.fr>
 <8c11a91b-cfbf-4b9c-a46f-907989bf8305@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8c11a91b-cfbf-4b9c-a46f-907989bf8305@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_105020_014105_26310A36 
X-CRM114-Status: GOOD (  14.34  )
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

On 5/31/26 10:41 AM, Daniel Lezcano wrote:
> On 5/31/26 09:51, Ronald Claveau via B4 Relay wrote:
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> After merging the thermal tree, linux-next build (arm_multi_v7
>> defconfig) failed like this:
>>
>> arm-linux-gnueabihf-ld: drivers/thermal/amlogic_thermal.o: in function
>> `amlogic_thermal_probe_sm':
>> /tmp/next/build/drivers/thermal/amlogic_thermal.c:196:(.text+0x2f4):
>> undefined reference to `meson_sm_get'
>> arm-linux-gnueabihf-ld: /tmp/next/build/drivers/thermal/
>> amlogic_thermal.c:205:(.text+0x320): undefined reference to
>> `meson_sm_get_thermal_calib'
>>
>> Add inline stub implementations of meson_sm_get() and
>> meson_sm_get_thermal_calib() behind an #else guard so that drivers
>> including this header can be compiled without CONFIG_MESON_SM .
>>
>> Fixes: b21d88de6918 ("thermal/drivers/amlogic: Add support for secure
>> monitor calibration readout")
>> Closes: https://lore.kernel.org/oe-kbuild-all/202605291530.en7aGn7w-
>> lkp@intel.com/
>> Reported-by: Mark Brown <broonie@kernel.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>> Changes in v2:
>> - Replace #ifdef CONFIG_MESON_SM by #if IS_ENABLED(CONFIG_MESON_SM)
>>    to cover builtin and module in config.
>> - Add missing trailers for kernel test robot.
>> - Link to v1: https://lore.kernel.org/r/20260530-fix-missing-meson_sm-
>> symbol-v1-1-3fb672b989d4@aliel.fr
>> ---
>>   include/linux/firmware/meson/meson_sm.h | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/
>> firmware/meson/meson_sm.h
>> index 3ebc2bd9a9760..baecdaf263f41 100644
>> --- a/include/linux/firmware/meson/meson_sm.h
>> +++ b/include/linux/firmware/meson/meson_sm.h
>> @@ -27,8 +27,25 @@ int meson_sm_call_write(struct meson_sm_firmware
>> *fw, void *buffer,
>>   int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
>>                  unsigned int bsize, unsigned int cmd_index, u32 arg0,
>>                  u32 arg1, u32 arg2, u32 arg3, u32 arg4);
>> +
>> +#if IS_ENABLED(CONFIG_MESON_SM)
>> +
>>   struct meson_sm_firmware *meson_sm_get(struct device_node
>> *firmware_node);
>>   int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32
>> *trim_info,
>>                      u32 tsensor_id);
> 
> Do you really want to compile meson_sm as a module ?
> 
> 
> 

I don't want, but if I send a patch to change tristate to bool, it will
raise a warning because 'm' is not valid.
If it is accepted to ignore this warning, I can send another patch.

-- 
Best regards,
Ronald

