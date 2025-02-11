Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D022C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jG+Kg4b36hIqapcRxzijjOB7mGphZe8juAjsg0omT0k=; b=dGue27GterUotj9yOgDcS1UJjA
	+uttsq9njGZ0VcjRqR8MED0H4OEI7hFcI2iEzMDdFj/uy0ZLv43fUP2fvkKM3qtJ4OIscYn+mf/3B
	U4Dx+rQGUhJY87OcKg9sDKPZQqH8cdvmpS8UgR188+Pl1ByZzm42xeKrrKK/tx0ZgFgq9g8rHRek6
	wY3sG6oFdqbTvPHb+n46GyZznPUZXs3b0z6MRXCT5V035TaTrnSA+SHan3dl3B5DDuMmCA9yjPRGf
	aQZ0uZKVZbAVYcinRNdTZDnPtPtnMOo5oiWdSjPWkO2+0DC8NAulrQ6sbvi0cJVeZ9X9ThESi5rx5
	Uay7O2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnA8-00000003Hmu-2j43;
	Tue, 11 Feb 2025 10:06:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thn8i-00000003HZc-3eBS;
	Tue, 11 Feb 2025 10:05:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B3G1dh030181;
	Tue, 11 Feb 2025 10:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jG+Kg4b36hIqapcRxzijjOB7mGphZe8juAjsg0omT0k=; b=nbOJkTXkkzIidNzh
	Kmp7MAqQ2eYvZNiQ3nk83QnBysYUc8zIze/E4CsGB7XeeVipSiim5VfmNHC7ROcn
	8rsQldPzU2KkvMC+vwrOFYtW0wLNkpEpbpLoex+829WLpgKl7FeXAof8RE6FpCIR
	s1SVHHY6uelob2ag1qxpABhhyBBBQOp4e/Dn+NzG7jr95d1AwDm8YRCnVp5Huq/7
	zB0QaS3Qx0dGO121eGV3682kb1fRWEAi5tMgjUByD/PAwVphIYWe2/7slI4NzvQX
	Qw360PdOCfD5PNRiWWG4a8T1Bp9y589wmvxCWW0bY/rj0yn9DNRNSG6rKklTrNLT
	+Xr+NA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9gxt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:04:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51BA4kGs013495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:04:46 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 02:04:39 -0800
Message-ID: <dfc6e506-bfe8-4c68-9991-13140eeab1ea@quicinc.com>
Date: Tue, 11 Feb 2025 18:04:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vop
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
        "beanhuo@micron.com" <beanhuo@micron.com>,
        "avri.altman@wdc.com"
	<avri.altman@wdc.com>,
        "quic_rampraka@quicinc.com"
	<quic_rampraka@quicinc.com>,
        "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "bvanassche@acm.org"
	<bvanassche@acm.org>,
        "junwoo80.lee@samsung.com" <junwoo80.lee@samsung.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>
CC: "ahalaney@redhat.com" <ahalaney@redhat.com>,
        "ebiggers@google.com"
	<ebiggers@google.com>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>,
        "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "minwoo.im@samsung.com" <minwoo.im@samsung.com>,
        "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
 <20250210100212.855127-2-quic_ziqichen@quicinc.com>
 <6dc8849886ff4ac6ceca7d8e36b853b27f337cb9.camel@mediatek.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <6dc8849886ff4ac6ceca7d8e36b853b27f337cb9.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qD3RD_wXC4qR4Uv2ZT-5mpbsMfZAlM5U
X-Proofpoint-GUID: qD3RD_wXC4qR4Uv2ZT-5mpbsMfZAlM5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_020513_025416_8D088F4A 
X-CRM114-Status: GOOD (  11.05  )
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



On 2/11/2025 11:52 AM, Peter Wang (王信友) wrote:
> On Mon, 2025-02-10 at 18:02 +0800, Ziqi Chen wrote:
>>
>> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
>> index d7aca9e61684..f51d425696e7 100644
>> --- a/include/ufs/ufshcd.h
>> +++ b/include/ufs/ufshcd.h
>> @@ -344,8 +344,8 @@ struct ufs_hba_variant_ops {
>>          void    (*exit)(struct ufs_hba *);
>>          u32     (*get_ufs_hci_version)(struct ufs_hba *);
>>          int     (*set_dma_mask)(struct ufs_hba *);
>> -       int     (*clk_scale_notify)(struct ufs_hba *, bool,
>> -                                   enum ufs_notify_change_status);
>> +       int (*clk_scale_notify)(struct ufs_hba *, bool, unsigned
>> long,
>> +                                                       enum
>> ufs_notify_change_status);
>>
> 
> Hi Ziqi,
> 
> Please keep the identation consistent.
> 
> Thanks.
> Peter

Sure, thank Peter.

-Ziqi
> 
> 
> 
> 
>>          int     (*setup_clocks)(struct ufs_hba *, bool,
>>                                  enum ufs_notify_change_status);
>>          int     (*hce_enable_notify)(struct ufs_hba *,
>> --
>> 2.34.1
>>
> 


