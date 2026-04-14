Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A99ED7B9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Mj/Oka325dO4DTA8Y3g+CRMxVCnYcU7sYESI0JYHgo=; b=bbIlWpFL+oAQx9qt6xOFq15Nce
	TSUSvRGn2t8qsk6TiWWGOkIRrQpU4O7A3SbuxEKaCvGCIw9nCca58DteCaTMVVelEbVFEUGSmtA6M
	XcdDo4NfDpKd7p1MpM3oh/zjtR847JHvtKsgw9yxynz5YxjX3SE+dNuq62yJisGa/xXphImzC9K69
	BrZ1+YKB5s5cb1ITmYBc1CmpaKMghbPmHOBjoVN6xu5ewmGX2dwC41ylemiDsLfygTzQb/sSYNyY8
	AI3/myVDeOb8u2qsuQ+7T9cnRGxV+77yjHidP4ytDV3/gDZZHreEyM3iYrfdYsHiOrlfaBAy00snH
	wJg8S/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbLW-0000000HBDV-3Bkn;
	Tue, 14 Apr 2026 10:50:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbLU-0000000HBDD-28fb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Apr 2026 10:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2Mj/Oka325dO4DTA8Y3g+CRMxVCnYcU7sYESI0JYHgo=; b=as2iGZdUJc0QZj8DEMq5Ggv4ji
	sgdv+3DqNIp9nzwkAZXrVgIaJVbWjvOA4Vj77e8tE3KsW6mfqQoll7R1BXSjpVSnVY2YJl+paFhVU
	/6br4bo70tr/gdyP0JSCPTKtZfBhWuxEZbFWmXzcC/9ARC4N/FKudmvd/jxRG7TIeXckZU3ec/uWh
	8MO3DiBGvv/vyWQbj57lDniEylpkypkOxjz84DsK+GpNYhmqMkdconZHQUiRQp99GR+JesQpzKycL
	ZUr2ape8KC+qVpTX7InIp2xOyUKnxdrLYMc7g2iu9vqbMBWPXJDrFA2/AdEIo0TsuYpzQLJNNsx10
	1rXrYJEg==;
Received: from layka.disroot.org ([178.21.23.139])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbLQ-0000000FRnr-3gqj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 10:50:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A11F32673A;
	Tue, 14 Apr 2026 12:50:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ah9wOf_RKuH4; Tue, 14 Apr 2026 12:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776163801; bh=ATR7jPCiqFhUJZWvipHfB9fQLlfRKaC77BcEuJfekz4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=bU5WOgvDZTzvFknUo05leQFShBt352kJl6xDKxA//wTjNOpFR0BsbGj2lmpW4LxFo
	 /6L+yP5O/Q+XDIAZSaQ7wgjFsc30YZYUbEFOgj6mPt03OLnnpJ6uw4nxzK5+9+obwp
	 2ZqbjkPEtZPrbqRAjxdGO5HqbXCNboQhy2WrgyE2WVNOx8hc116sj/bfJ3XtOW4wmE
	 PXNkMieYy1iXmiell9tTjrk1extFxAcOjyQhEguYEQCEfkf77jgyPsLxZb9f0mQCs/
	 b1p+jWbCMMKNvyGas1o/maZmXZBOJ6M5E/jzMtoQfhwUhZHtb06n5AOKCXBUnDcEMf
	 XXhykpnNkkWlA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 16:19:52 +0530
Message-Id: <DHSTILN3EP1X.1KGAMPFVIKXJC@disroot.org>
Subject: Re: [PATCH v2 1/2] mmc: dw_mmc: implement option for configuring
 DMA threshold
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Shawn Lin" <shawn.lin@rock-chips.com>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>, "Ulf Hansson" <ulfh@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Jaehoon Chung" <jh80.chung@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
Cc: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>
References: <20260414-dwmmc-dma-thr-v2-0-4058078f5361@disroot.org>
 <20260414-dwmmc-dma-thr-v2-1-4058078f5361@disroot.org>
 <cec99f99-5ac4-7f0d-8e2a-947edfef8930@rock-chips.com>
In-Reply-To: <cec99f99-5ac4-7f0d-8e2a-947edfef8930@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_115013_008170_1840B5A0 
X-CRM114-Status: GOOD (  15.71  )
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

On 2026-04-14 16:50 +08:00, Shawn Lin wrote:
> =E5=9C=A8 2026/04/14 =E6=98=9F=E6=9C=9F=E4=BA=8C 16:36, Kaustabh Chakrabo=
rty =E5=86=99=E9=81=93:
>> Some controllers, such as certain Exynos SDIO ones, are unable to
>> perform DMA transfers of small amount of bytes properly. Following the
>> device tree schema, implement the property to define the DMA transfer
>> threshold (from a hard coded value of 16 bytes) so that lesser number of
>> bytes can be transferred safely skipping DMA in such controllers. The
>> value of 16 bytes stays as the default for controllers which do not
>> define it. This value can be overridden by implementation-specific init
>> sequences.
>>=20
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>   drivers/mmc/host/dw_mmc.c | 5 +++--
>>   drivers/mmc/host/dw_mmc.h | 2 ++
>>   2 files changed, 5 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
>> index 20193ee7b73eb..9dd9fed4ccf49 100644
>> --- a/drivers/mmc/host/dw_mmc.c
>> +++ b/drivers/mmc/host/dw_mmc.c
>> @@ -40,7 +40,6 @@
>>   				 SDMMC_INT_RESP_ERR | SDMMC_INT_HLE)
>>   #define DW_MCI_ERROR_FLAGS	(DW_MCI_DATA_ERROR_FLAGS | \
>>   				 DW_MCI_CMD_ERROR_FLAGS)
>> -#define DW_MCI_DMA_THRESHOLD	16
>>  =20
>>   #define DW_MCI_FREQ_MAX	200000000	/* unit: HZ */
>>   #define DW_MCI_FREQ_MIN	100000		/* unit: HZ */
>> @@ -821,7 +820,7 @@ static int dw_mci_pre_dma_transfer(struct dw_mci *ho=
st,
>>   	 * non-word-aligned buffers or lengths. Also, we don't bother
>>   	 * with all the DMA setup overhead for short transfers.
>>   	 */
>> -	if (data->blocks * data->blksz < DW_MCI_DMA_THRESHOLD)
>> +	if (data->blocks * data->blksz < host->dma_threshold)
>>   		return -EINVAL;
>>  =20
>>   	if (data->blksz & 3)
>> @@ -3245,6 +3244,8 @@ int dw_mci_probe(struct dw_mci *host)
>>   		goto err_clk_ciu;
>>   	}
>>  =20
>> +	host->dma_threshold =3D 16;
>
> I'd prefer to set it in dw_mci_alloc_host() instead of picking up
> a random place to put it, for better code management.

Okay, that function is in -next I see.

>
>> +
>>   	if (host->rstc) {
>>   		reset_control_assert(host->rstc);
>>   		usleep_range(10, 50);
>> diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
>> index 42e58be74ce09..fc7601fba849f 100644
>> --- a/drivers/mmc/host/dw_mmc.h
>> +++ b/drivers/mmc/host/dw_mmc.h
>> @@ -164,6 +164,8 @@ struct dw_mci {
>>   	void __iomem		*fifo_reg;
>>   	u32			data_addr_override;
>>   	bool			wm_aligned;
>> +	/* Configurable data byte threshold value for DMA transfer. */
>
> No here, there is a long section of comment before struct dw_mci{ } that
> describes each member of it, please add it there.

Ah, you mean the documenting comment. Shouldn't have missed in either
way.

>
>> +	u32			dma_threshold;
>>  =20
>>   	struct scatterlist	*sg;
>>   	struct sg_mapping_iter	sg_miter;
>>=20

