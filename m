Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5514CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwTC1fVt+YSHOpVKiEz3YJ3Wb+QFfPzZMI+15IrngMA=; b=XL2YxaF4+BLpk52rFeyJkc6vWK
	mg+NwqHglkeGdXEnry52nAOIu70wt1lfQJU1wf5kvPJ+5CIS7eppuGxYX+zLqdX7AS61gVVLQkpRm
	zSMHy5hF0fAocZ3RzlB+HCq27J06uYRceDu5aM59B1BZoPFjLiPKHr0S8U4FZtZPW1onkB/gTPa9j
	orT27BWqOAhtruVmY8m5vIV63XLOrBtMPAZHXP+mHnP/oxUmWCfZoWHhByBXErc+qBO0y8gWLwAtg
	mQq47pGEHVFOdOERgzfW77aPXpOqjejWCF158ibwjDVCm9SUcF7G0IWVjYcfiR+OdSa2POfuuh4wb
	UuMLatwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zjk-0000000EnkH-01jU;
	Thu, 24 Apr 2025 16:47:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zUn-0000000El0U-280P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 16:32:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3gUG017703;
	Thu, 24 Apr 2025 16:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwTC1fVt+YSHOpVKiEz3YJ3Wb+QFfPzZMI+15IrngMA=; b=AK750G2NVD1rifAO
	xP1Cs2lV2yb8jhuhPpARdJR8LCcxiyq/WhJ03FFMB9KNSsBnMd1ebWX5k8/DN9xA
	kdBqPkmMZNnlk8YPT5GgdKGlxBNGx1rirRcft5by2QVsD41779mLWLB34rGr5kPD
	cT1aPvIwg6pl7eUlCm31y5FbnTGLZAp22Jiise7YMJlsnFuAvtEXvfkJyiKjVrvS
	HDfQCMU+P9SR17FkQhutUNtv7NqYOZBrMKn2btTQp+Di0llTBabYKFeU75A8fEAK
	Ujn6DmugJOzP/nDg8UtfgLepNncAnGbeBho8UiRIxBVUjpiihShDwcRGAFMAGQp4
	wunaGw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh26bjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 16:32:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OGW9qO009059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 16:32:09 GMT
Received: from [10.110.125.18] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 09:32:08 -0700
Message-ID: <37df3ce3-2161-4c42-a658-d36fc4208ee8@quicinc.com>
Date: Thu, 24 Apr 2025 09:32:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] coresight: Add coresight TGU driver
To: Songwei Chai <quic_songchai@quicinc.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark
	<james.clark@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250423101054.954066-1-quic_songchai@quicinc.com>
 <20250423101054.954066-3-quic_songchai@quicinc.com>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20250423101054.954066-3-quic_songchai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680a678a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=YS0KeBGhMWwNwvnsnWcA:9 a=QEXdDO2ut3YA:10
 a=AMdsP11zolQA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dZGMBpIijIK4QXnUq6ZzHrYOevnpaL8a
X-Proofpoint-ORIG-GUID: dZGMBpIijIK4QXnUq6ZzHrYOevnpaL8a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDExMyBTYWx0ZWRfX4zUtTjqz+Al5 BQy8fRU1XgcGDZ/Si7XPxYClnJ06DWxxYfM32Sfg3/MpzahV64fbIlW8GovTA6HqADaKPszZPOG YVCXeU32Jw4Rxck5q2CknmAb277ZC5U15KLiy8COTbxG0VnjmRaF9gERNa34CAYEkjmsTi+loc8
 502NOBZlcMYsIIu+cgnpbljsrF/zC57hCPjZ84Sgou/oq70PbBh8Nr2jQyBrBCQse1B4fzLBb03 CtaWvT0wGZ+58xY7p/D6R8tlv9baoKuXHveT7dwCgqfAK8tzMeCw9v6NMoaLREx7z6E0BOMygMk fs63QKHjrKQP0K3TLFnqwAeciic1X7sjMiKimc/vRR0YNxzLp6UPDz4HVQwo1+UWpZ8xpH2A+Rr
 3pBnX3J5QMunFndXLlrtcSwY/fMpfLVm32jS8LAimek1l/3R7VOc0YbM4QKGd42ewOQGe0lN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_07,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 spamscore=0 mlxlogscore=916
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_093217_553561_9FBCF28B 
X-CRM114-Status: UNSURE (   6.35  )
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

On 4/23/2025 3:10 AM, Songwei Chai wrote:
> +Date:		February 2025

If you are sending new revision then please update month and kernel version. 

> +KernelVersion	6.15
> +Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>


-- 
---Trilok Soni

