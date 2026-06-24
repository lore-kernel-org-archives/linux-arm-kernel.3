Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B952CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 06:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukhpUveUhCcsTNezW32T4stInqGebOCuIowBEQQGEo8=; b=MB/8vwvWSR8+BlITQWEqlb0Dva
	q0zAleAFEECh8B2GyPnkQww9/QxgcVQj15lr8zGaRjpYjrEG84lvCLLbZrECMQhK7o5/VxTjOU9ve
	+bEH47ekWmh2+MlxveBPOU5fMPdam5y6fmqjBSocJ8oQOZAijXmx7jy9j1Da+vFHUqrrvSpIh+vic
	n0VgVKr7gD4ruA9vToo1Ma2x7GbbRS6H3mt2DFgl0Pznd2CgSPTqNP+geCSnRBGRAK0E7Mh5oOxrQ
	/FgDyIpiucE1pD2NAMcjWVxk2E7JJzSkepgLn1nv9PaNrRKniQHqCN1EGMCoR58dXOETteBAnpL+6
	O16rSQWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcH7g-00000007EFG-3JP9;
	Wed, 24 Jun 2026 06:30:08 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcH7c-00000007EEq-3CSQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 06:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1782282601; x=1782887401; i=wahrenst@gmx.net;
	bh=ukhpUveUhCcsTNezW32T4stInqGebOCuIowBEQQGEo8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=EZzYWnvTctwtZ9gQYzcG1dNocWXjUx1rfbTcjEx1gh1ZEYwIuDLuht1feRpZI/rp
	 s4pnhGnsNqcmTOz9Utdctq7cC2BvmGc2UMLAcB5li3+8vKNjN2WIezU6Yunf33m4V
	 AqNrefh8wItqXEIVZxiosr7bWKmgqkCB7DKbx0Fzl2tT7v6eBGwJKcnWMyzB49LI1
	 Pl8vgIUfWkWIjs6DLSZeQkjwO/iFybTcsP7hNiFV3BY2axUcQeILHJFhD4KS07SOL
	 Wev5otl8TtuUUlesHfgFJCEa49s2NmbqeCI325DtbBFd/dSXFYeARJPbUFOxtdIcL
	 75h4s1Yig653u0gMOA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Ed-1xIvVV3usH-00zbTG; Wed, 24
 Jun 2026 08:30:00 +0200
Message-ID: <40e4df43-5de8-48fb-9c5d-9ccb437e63b9@gmx.net>
Date: Wed, 24 Jun 2026 08:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: chipidea: usbmisc_imx: i.MX93 support
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Jun Li <jun.li@nxp.com>, Alexander Stein <alexander.stein@ew.tq-group.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <b2fb88eb-5c5f-499f-9cee-6a69769c578c@gmx.net>
 <ibkjg6bymxoy5wcewrfn4y63f5izlh2yvdqjt42a63kvttr42w@tvqjjhfjg3u4>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <ibkjg6bymxoy5wcewrfn4y63f5izlh2yvdqjt42a63kvttr42w@tvqjjhfjg3u4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S3UIrxmgBO+cZPH4erVnGWu+WIlej1MD4/kV1mYIpAqv+DfSESx
 yqMqzgrAWkT1UzkRL/wH9V1Tkhh7/nDzz/ylBxqeKvo6vQ7/LIFrNNRpuNzqaeobC5YaXF8
 aJVIuUftEEmeA9ZzqpMOHBa1IurY7eydrVBb9vk43E262wKWUNg+YbM09/EKVO4h8GpcbwR
 9tf1IYLwgLYmbZIrsoHvQ==
UI-OutboundReport: notjunk:1;M01:P0:6uw1fw5zhzc=;R97K/mnC6Es28BjzLKmbtJvny8/ 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_233005_150301_C20AF8A8 
X-CRM114-Status: GOOD (  17.39  )
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

Hi Xu,

Am 24.06.26 um 04:50 schrieb Xu Yang:
> On Tue, Jun 23, 2026 at 12:23:12PM +0200, Stefan Wahren wrote:
>> Hi,
>>
>> during debugging USB OTG on our custom i.MX93 board, we noticed remarka=
ble
>> differences between the implementation of the chipidea/usbmisc_imx and =
the
>> official NXP i.MX93 Reference Manual [1].
>>
>> Is the USB OTG part including PHY of the i.MX93 officially supported in
>> Linux Mainline?
> Yes.
>
>> According to imx91_93_common.dtsi the USB IP of the i.MX93 should be
>> identical to i.MX8MM [2]
>>
>>  =C2=A0 =C2=A0 usbmisc1: usbmisc@4c100200 {
>>
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D "fsl,imx8mm-usbmisc", "fsl,=
imx7d-usbmisc",
>> "fsl,imx6q-usbmisc";
>>
>> But looking at the PHY register definition and reset values in the NXP
>> i.MX93 Reference Manual,
>>
>> the registers are comparable to the i.MX95 [3] ones.
>>
>> Could you please clarify which source is correct (Mainline DTS vs Refer=
ence
>> Manual)?
> The Reference Manual is correct.
>
>> Looking deeper at chipidea/usbmisc_imx shows the usage of the following
>> register bits
>>
>> #define MX7D_USB_OTG_PHY_CFG2_CHRG_CHRGSEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>>
>> #define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATDETENB0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>>
>> #define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATSRCENB0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2)
>>
>> #define MX7D_USB_OTG_PHY_CFG2_CHRG_DCDENB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(3)
>>
>> #define MX7D_USB_OTG_PHY_STATUS_LINE_STATE0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>>
>> #define MX7D_USB_OTG_PHY_STATUS_LINE_STATE1=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>>
>> #define MX7D_USB_OTG_PHY_STATUS_CHRGDET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(29)
>>
>> According to NXP i.MX93 & i.MX95 Reference Manual, these are bits reser=
ved.
>>
>> Is it correct that the chipidea/usbmisc_imx use these bits on i.MX93?
> i.MX93 & i.MX95 no longer claims to support Battery charger detection. S=
o these
> bits are reserved. However, at the IP level, accessing these bits will n=
ot produce
> errors. We will remove .charger_detection hook for the i.MX9 series in t=
he future.
I think the access to MX6_BM_NON_BURST_SETTING should be addressed, too.
> Do you want to use Battery charger detection on i.MX93?
No, we don't need this feature in our case. We suspect the cause for our=
=20
issue comes from the hardware design of the board.

Thanks
>
> Thanks,
> Xu Yang
>
>> Best regards
>>
>> [1] - https://www.nxp.com/docs/en/reference-manual/IMX93RM.pdf
>> <https://www.nxp.com/docs/en/reference-manual/IMX93RM.pdf>
>>
>> [2] - https://www.nxp.com/docs/en/reference-manual/IMX8MMRM.pdf
>> <https://www.nxp.com/docs/en/reference-manual/IMX8MMRM.pdf>
>>
>> [3] - https://www.nxp.com/docs/en/reference-manual/IMX95RM.pdf
>> <https://www.nxp.com/docs/en/reference-manual/IMX95RM.pdf>
>>


