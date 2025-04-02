Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AD4C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 19:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ij6oVdOz4GhS0vGrhbityqjcv93TkR0sIrqUodkZMFk=; b=iCuGLqcuFwLhu/8LfO2Jz/1luc
	sJuxhuFwswDAVvGhHSaTDz5qP7MfxxwUL2vvwLSUgKD/pBezCQHRAomHXHhvbNs5u+oR0RqYNsVgT
	Q/vSkpwFL6MlfR9WHLSmz3yPnbV32VMU7wdnfz00toj7TB9kL3stTNWTIYi0+y0WWPeJWKq8dp2fH
	gXwJ2yV8+s3F5z5HxctFnx9dBsesVmOZRdusmtYM/N7iQhFmKidLYgxFhI/8C2bQZdKyrFXqiZo5R
	qDCmF8emCnD8EmzxBH9TjP5a4bNZRmPMjb8LpTyZDxAJL2dAPOHiw4V3EGcXPcv3ZRd+iaJOwsAwB
	0iFZF8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u03NC-000000070Dp-3rn3;
	Wed, 02 Apr 2025 19:03:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u03KT-00000006zjP-1B4G;
	Wed, 02 Apr 2025 19:00:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532C1hZx024534;
	Wed, 2 Apr 2025 19:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ij6oVdOz4GhS0vGrhbityqjcv93TkR0sIrqUodkZMFk=; b=hYhD7pVNIeDwDBrW
	RdO5PrMwS8sO1ippIQSGUyIYQ2aHb7qJuvA8S/CTVfe+wl3fGVcBkK+tVHJeC/Fq
	hL0quAhjsZgdxh4KYOc6r2i6Gy0K17YxXYIvcN3aAPcOVgVQfvxnN1L1QRwh3B/f
	iNw133fc//aUQBjMULW74HoUe6hVoYaUgy9HMacMC7MaMwE5l9UNz5swOuqq8Os5
	wu3dTwbUcX100OEvJokqUmtO2Ui7Bihi+ChA5Cq0uSXw6qzZZsLnr5JqmT6CIlBj
	jsmAF8BSmVLuxw7LwpPsMxs6waa4SBRHV0VIQ6IaNJwJBe63uNd47fsw3lzvLxqP
	V7jENg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpywh5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 19:00:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 532J0RBJ002057
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 19:00:27 GMT
Received: from [10.46.162.103] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Apr 2025
 12:00:26 -0700
Message-ID: <1b87152e-ff0f-9c45-020d-4927ff3dbef8@quicinc.com>
Date: Wed, 2 Apr 2025 12:00:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/1] scsi: ufs: core: add device level exception
 support
Content-Language: en-US
To: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        Bart Van Assche <bvanassche@acm.org>
CC: Arthur Simchaev <Arthur.Simchaev@sandisk.com>,
        "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com"
	<quic_nitirawa@quicinc.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
        "minwoo.im@samsung.com"
	<minwoo.im@samsung.com>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Bean Huo <beanhuo@micron.com>,
        Keoseong Park <keosung.park@samsung.com>,
        Ziqi Chen
	<quic_ziqichen@quicinc.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Gwendal
 Grignou" <gwendal@chromium.org>,
        Eric Biggers <ebiggers@google.com>,
        open
 list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>,
        "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
	<linux-mediatek@lists.infradead.org>
References: <4370b3a3b5a5675bb3e75aaa48a273674c159339.1742526978.git.quic_nguyenb@quicinc.com>
 <SA2PR16MB4251229744D717821D3D8353F4A72@SA2PR16MB4251.namprd16.prod.outlook.com>
 <c5ab13ec-f650-ea10-5cb8-d6a2ddf1e825@quicinc.com>
 <0a68d437-5d6a-42aa-ae4e-6f5d89cfcaf3@acm.org>
 <ad246ef4-7429-63bb-0279-90738736f6e3@quicinc.com>
 <3d7b543c-1165-42e0-8471-25b04c7572ac@acm.org>
 <4cb20c80-9bb0-e147-e3c0-467f4c8828ba@quicinc.com>
 <989e695e-e6a4-4427-9041-e39ecf5b5674@acm.org>
 <yzy7oad77h744vf2bdylkm4fronemjwvrmlstnj6x5lzjxg672@zya6toqv4aeg>
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
In-Reply-To: <yzy7oad77h744vf2bdylkm4fronemjwvrmlstnj6x5lzjxg672@zya6toqv4aeg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nuJyCFbkUJbHjGlJ8RMkEV0OQHadcz5I
X-Proofpoint-ORIG-GUID: nuJyCFbkUJbHjGlJ8RMkEV0OQHadcz5I
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ed894c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=Si26H9tSdrSrRDVtBSgA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_08,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_120049_339817_BC0077AB 
X-CRM114-Status: GOOD (  15.41  )
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

On 4/2/2025 12:49 AM, manivannan.sadhasivam@linaro.org wrote:
> Yeah, we should be cautious in changing the uAPI header as it can break the
> userspace applications. Annotating the members that need packed attribute seems
> like the way forward to me.

Yes, I realized potential issue when Bart raised a concern.

> 
> Though, I'd like to understand which architecture has the alignment constraint
> in this structure. Only if an architecture requires 8 byte alignment for __be32
> would be a problem. That too only for osf7 and reserved. But I'm not aware of
> such architectures in use.
When using "__u64 value;" in place of osf3-6, I saw the compiler padded 
4 bytes, so __packed was needed for me to get correct __u64 value. I 
thought even the existing structure utp_upiu_query_v4_0 may need 
__packed on some fields where the driver reads the returned data in 
order to be safe across all architectures. However, without evidence of 
an actual failure, I didn't touch the existing structure. Only raised 
potential issue for discussion.

Thanks, Bao

