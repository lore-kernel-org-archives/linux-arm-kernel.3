Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BEFC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 21:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4y6PpJpBvWFd4janBIfhVIiKUNQpKumZnChgRc1rMHc=; b=sQ4IThsPZSzjm3QoJTRWdwV19o
	gs/Ruaku9zcS4CYFJ8v658KpfpZCaZv/6KBGcuaTHEpzPCywZwyYAtTfeshFzPANgF4eVNtJ8Bjts
	JB2RgwAgjWpeNeTxo974flOyzRgeNAGAM0hxxMbtWtA84SEND2ORTm0KyEXr2gc/QaAa6BI5WdY+n
	9WLp9VwWoHrngfubtXFbFLhcqAUL7PraVNy9B9O/9Q+njMTVl8pXcnDz7R3S1zwyEkd0HhvBsLlg4
	Wvwi9x0H9hl1I6jASA0MTcjF5drOu3GuUVvSMcwy3OLtiHKAwZMxR4Pwq8Nd6fOcaPNDTb53poxst
	316thynQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJK9-0000000GLzw-2oEA;
	Wed, 14 May 2025 21:07:33 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJI8-0000000GLcx-0Lik;
	Wed, 14 May 2025 21:05:29 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4ZyQph1mslzlytFj;
	Wed, 14 May 2025 21:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1747256712; x=1749848713; bh=4y6PpJpBvWFd4janBIfhVIiK
	UNQpKumZnChgRc1rMHc=; b=x+6W/6QDkL7EY+dpOuW6aAvIA2BJcx+poFLSCnez
	c9kP6soLoce7VKhm/J58RbrrT7MdFOBDPzBeUx79eWIh/kUcNUuEfyoL1L07fPfL
	q7LGxAC8ZkZpHWJ6Nel0i+AJL39sbFHhB2pjddhShrRU6G/F9nwcyyBp15s2s4er
	/7McPBtoFjzc9lawcVBvslN7QSlH8HvBHjE8HrhUNnki833OeyyhZtZJ/G3Act21
	8hbBdM0TLEgIn0x6qTRAHV+GGnoLpAq8xToSI1DB2Oz6f0zQwb3BTOLZ5Y7aj480
	2vaaRwFRkVlJIYQU9ABnkYlF/rvsS7QfoVjJ4GLfd9/p/w==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id q7JJV-5aA4eK; Wed, 14 May 2025 21:05:12 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4ZyQpL6nSDzlyj4g;
	Wed, 14 May 2025 21:04:57 +0000 (UTC)
Message-ID: <88718b2f-0583-4444-8bf0-7ecf9a45329c@acm.org>
Date: Wed, 14 May 2025 14:04:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: Add HID support
To: Huan Tang <tanghuan@vivo.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, peter.wang@mediatek.com,
 manivannan.sadhasivam@linaro.org, quic_nguyenb@quicinc.com,
 luhongfei@vivo.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: opensource.kernel@vivo.com, Wenxing Cheng <wenxing.cheng@vivo.com>
References: <20250512131519.138-1-tanghuan@vivo.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250512131519.138-1-tanghuan@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_140528_209704_E06D3B43 
X-CRM114-Status: GOOD (  14.90  )
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

On 5/12/25 6:15 AM, Huan Tang wrote:
> +What:		/sys/bus/platform/drivers/ufshcd/*/ufs_hid/hid_analysis_trigger
> +What:		/sys/bus/platform/devices/*.ufs/ufs_hid/hid_analysis_trigger
> +Date:		April 2025
> +Contact:	Huan Tang <tanghuan@vivo.com>
> +Description:
> +		The host can enable or disable HID analysis operation.
> +
> +		=======  =========================================
> +		disable   disable HID analysis operation
> +		enable    enable HID analysis operation
> +		=======  =========================================
> +
> +		The file is write only.

All HID sysfs attributes occur in the "ufs_hid" directory and have a
"hid_" prefix. That's two times "hid". Please remove the "hid_" prefix
from the sysfs attribute names since it is redundant.

> +static struct attribute *ufs_sysfs_ufs_hid[] = {
> +	&dev_attr_hid_analysis_trigger.attr,
> +	&dev_attr_hid_defrag_trigger.attr,
> +	&dev_attr_hid_fragmented_size.attr,
> +	&dev_attr_hid_defrag_size.attr,
> +	&dev_attr_hid_progress_ratio.attr,
> +	&dev_attr_hid_state.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group ufs_sysfs_ufs_hid_group = {
> +	.name = "ufs_hid",
> +	.attrs = ufs_sysfs_ufs_hid,
> +};

Isn't the prefix "ufs_" in "ufs_hid" redundant since this sysfs group
occurs under a UFS host controller directory?

Regarding the name of this sysfs group, "ufs" occurs twice in that
name (ufs_sysfs_ufs_hid_group). Please make sure that "ufs" only occurs
once in that sysfs group name.

>   #define UFS_LUN_DESC_PARAM(_pname, _puname, _duname, _size)		\
>   static ssize_t _pname##_show(struct device *dev,			\
>   	struct device_attribute *attr, char *buf)			\
> @@ -1898,6 +2079,7 @@ const struct attribute_group ufs_sysfs_lun_attributes_group = {
>   
>   void ufs_sysfs_add_nodes(struct device *dev)
>   {
> +	struct ufs_hba *hba = dev_get_drvdata(dev);
>   	int ret;
>   
>   	ret = sysfs_create_groups(&dev->kobj, ufs_sysfs_groups);
> @@ -1905,9 +2087,22 @@ void ufs_sysfs_add_nodes(struct device *dev)
>   		dev_err(dev,
>   			"%s: sysfs groups creation failed (err = %d)\n",
>   			__func__, ret);
> +
> +	if (hba->dev_info.hid_sup) {
> +		ret = sysfs_create_group(&dev->kobj, &ufs_sysfs_ufs_hid_group);
> +		if (ret)
> +			dev_err(dev,
> +				"%s: sysfs ufs_hid group creation failed (err = %d)\n",
> +				__func__, ret);
> +	}
>   }

Please merge ufs_sysfs_ufs_hid_group into ufs_sysfs_groups, remove the
new sysfs_create_group() call and add a visibility callback in
ufs_sysfs_ufs_hid_group that only makes the attributes in this group
visible if hba->dev_info.hid_sup == true.

Otherwise this patch looks good to me.

Thanks,

Bart.

