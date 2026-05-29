Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA192CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 01:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyR0jNyg51FLGM0Fwv/BNrV/LG6rLNf+jCbaD0Res2U=; b=wbmYShdpWOoqtk6lYWs3IHrbyp
	cFvk7Ar1gxd/4ns2SwLdd6AlhunHFyCBZMFGoYNIk/a8X1mNzBXHWFkztzRIbHbOZbD/J+vBHBDVv
	5gHHK3cg0dEcpCaV0vapJ/EywhyObO312SykBbPpjMOMLf6Y5jnzjIkiqoLaK7T2DX8K7JAaiqh5w
	YZD9IHMMH/hbiOwdVMjeVnNyrrhQzBnYY6FYUTNdMVPo3yujLrs8+tKkRl+x/cPRsIpqlg+JYdryI
	A2Dhjo/0kYdQNvitVDSsm2HaDYSU6WpJc47rdm7JgqdJHFIQZXf+wvnAmjT9IUW3Q90Qkueo8eYQI
	d8rDAFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSm5J-00000006bzm-1DlP;
	Fri, 29 May 2026 01:32:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSm5G-00000006bzA-3DLG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 01:32:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T0A7C91495706;
	Fri, 29 May 2026 01:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyR0jNyg51FLGM0Fwv/BNrV/LG6rLNf+jCbaD0Res2U=; b=QXK066fTU7rqm/Qd
	8f5Zukv/or8+GG95ChPvQio93eyRAYAJsg+J9qVj3YDCU8pZtyW+U3dIvkbbPPE0
	p7KknVlv8s5YD8F57fUZny5btgle9zvQQsaj0uil+FfkDRxDn1+B/FJgpvXqt7Km
	kC4Ezy9DqHBSFe3qcSrmrQpOR6TIxs7dJFHwzwdBlN1wvMqPwbr3HxvfDb64t1+V
	3zAoUrTIFjsy0tgGNdiR4gJXZTLjVXdStbowUdK/5tVbX78iJfdK1HowXXb4bgLh
	SVhyWSCwtyal/0wTTILdHDivRe2xepv9vunaKEX5XQfNtn7WOmSkINhuAL69w8Tm
	TK4ZUw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef01587wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 01:32:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 64T1WFA3011031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 01:32:15 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 28 May
 2026 18:32:12 -0700
Message-ID: <c3564b85-955f-4839-94b1-0345707a1ab5@quicinc.com>
Date: Fri, 29 May 2026 09:31:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] coresight: cti: Convert trigger usage fields to
 dynamic
To: Leo Yan <leo.yan@arm.com>, Yingchao Deng <yingchao.deng@oss.qualcomm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <jinlong.mao@oss.qualcomm.com>, <tingwei.zhang@oss.qualcomm.com>,
        <jie.gan@oss.qualcomm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-1-d21f4f92c51e@oss.qualcomm.com>
 <20260528180129.GJ101133@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20260528180129.GJ101133@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: Mxx0XKoQrU2Emb-QQixZ28gFrlzVnZJP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAxMiBTYWx0ZWRfX1evf7YtoXpX9
 z/OC1ep/uYV93Sun7G9U9ZX7c0delhP058h2kYd+kF2q/h7cIpX+qn4RPPA2nvM8RkaEFcpgIYh
 tvlzmuqeGaLiWKQ8XAMW7Dj0VtwaVkmKACCKfSAoV2k+6flZwOxD/5uthFL9SO31n2+1fgY+Zob
 lc7dwT5iKIkwDDgOoHHXXlP4xflS4RMbL5pKBw7biI8V5iGTtdCE7U9JP8xRCVKk0QZs5FW1RSc
 cRZniNtatUk5FunAQMa+HO8M5/hpTG5Lbo6LUDGui4z+c+oEI4y0POi3jV8E1S7fyHXnIR331tV
 WsvbZOFupVVQlxPRdU8cTRBr+SA8NR6PMqmb2bjmw6FxyMUyAUjAovVgADKA3jlsK+UWoTmpzKo
 y5D2sEK+fxhhDsZv/zmTLrmeqB0ky+MU1u33qTxD8eNbxPNrrjOPGc5ozAfxqRBRzO4bmW3NRSc
 pw3adwp3YK760VBLu4w==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a18ec9f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=sI340vtnV6QC4qxvR_4A:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Mxx0XKoQrU2Emb-QQixZ28gFrlzVnZJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_183222_823520_A2DBE9E6 
X-CRM114-Status: GOOD (  14.70  )
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


On 5/29/2026 2:01 AM, Leo Yan wrote:
> On Thu, May 21, 2026 at 08:16:27PM +0800, Yingchao Deng wrote:
>
> [...]
>
>> @@ -231,6 +254,8 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
>>   {
>>   	struct cti_trig_con *tc = NULL;
>>   	struct cti_trig_grp *in = NULL, *out = NULL;
>> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev);
>> +	int n_trigs = drvdata->config.nr_trig_max;
> I don't mind it allocates bitmask with nr_trig_max, but AI review
> suggests that when in_sigs / out_sigs bigger than nr_trig_max, it might
> access memory out-of-boundary (see cti_plat_read_trig_group()).
>
> It is good to add a check:
>
>      if (in_sigs > n_trigs || out_sigs > n_trigs) {
>          dev_err(dev, "trigger signal is out of range: in=%d out=%d nr_max=%d\n",
>                  in_sigs, out_sigs, n_trigs\n");
>          return NULL;
>      }
>
> With this:
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
>
> BTW, I have given my review tag on v8, please remember to update
> patches with review / ack tags.

Will update.

Thanks,
Yingchao

