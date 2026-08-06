Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC30C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fx9UkPI2/eVI7/G8hFIhX+SVBVFckt785d9/b/IsG/w=; b=rllmI4VRR5T4oSUtpNk//UISaP
	4fySvNQPunZJsBOKVaBYucCkf1/LKTAkPWCokkTDxoGdM3ovktler2+Kh116u8QX3RiV7+LpeGJ+l
	689WbpFP/cwxiSfj3e5xj/9Yu2ram8hiTa151hUe+jSiKW0nxMZNKt2b6afWRfvTAwIbb7AL5etut
	dOc03BUxaSsTDYzQraJv53GsotQau36+Stvp44jUzzowX44u/cEFT2XPgm3o2uDP8/HVOAn89ZoCZ
	ARSQaw2R7VUPHEDPDZtdbE5rsWZOqgTGlox7GXIK2Fr/kx+OMnH+pWHc0zP7rDz3AoC9OPniCO+4M
	R7XrHAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrusR-00000005U59-0XJY;
	Thu, 06 Aug 2026 09:59:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrusP-00000005U4o-3lwQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Aug 2026 09:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Fx9UkPI2/eVI7/G8hFIhX+SVBVFckt785d9/b/IsG/w=; b=IIFqcdvVF4mNuv9fcbW+z3baW7
	KG3tjljXyzyvfaWXxnondwgRaKXi1HNrrqfq6gZmQsqwTAbm46ZsrKzdAp5YItLHiKtLuFfY7ADbw
	DvEJDfcViywucOQgCbUSMfn9f6dvNtEiNx5Jh5lCdlTKrxGsJXCwRIfnIFVRYBTGi14y248AhOxoo
	rdZa8mXfqVLjr7HLGCbiCPEbzP3nByEQeiMBfSCTDtDvWcyUJcsC6z9KNLYltXdK+u83QDa+e4TYi
	ALz9w40X8Y1ji1vA8+dSuih7SG2z2g2u1Bn6Cc39tXIr1gQqwX3WrCeOeSi7WpIRTPlwjIvL7vEWV
	dVHZqH6g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrusM-0000000BOgn-3Gb0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:59:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nrFO1278074
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 09:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fx9UkPI2/eVI7/G8hFIhX+SVBVFckt785d9/b/IsG/w=; b=KmwramH2AQ7tLxSZ
	Jj7I0GUOgipYTvaRdwNWV8APeDGz+UhXcLhK4EstQekIMjncFVmLRSzqsH/XZJFi
	jQsNSYe+tWcHK152OLTeoJyhMAS9LQpu/3SEFwhgFja5iY1yHZJpiesG3cS1NilW
	CTT16uublfNjyoRXaBHcKe5mzQr53tkwsZ47y4ZWgmieoTZ4aXWYOtuJi4Ogz8OJ
	KydxY0QVSDopT2yxptE9xg356iOC/0Lk8dxALtUHSPYXukVPfGiGyEmHTTQpyZcN
	FxdGLsCTWKYMTegRsBIbsy2mkgBAj+0oci65dYJnn7nSBo7nCmOk9539vKRvfnKs
	KvijJQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuehdh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 09:58:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485d853b08so3482553b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010333; x=1786615133; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fx9UkPI2/eVI7/G8hFIhX+SVBVFckt785d9/b/IsG/w=;
        b=NkicJ003p+WnG1kUWy+0WI1dAp3jL6TnxVGnNz4WlTqkinAIfR1zMhLC8cDHctEtEm
         tNIBGGViySpu8bBDm8X/Ov1Z7CJFbj3JnZ467rkOVN25WNfJbSOkk+9ZXWN9yd3VpdtI
         fibLUWW5LiXnXlSPR4Qmhum3Ax6d0ti492S0va055L6lAliguFQkKMnBqnANhR48X9oQ
         TwZDHMBLG20zDlvFAk7e6aXv8oWLq0ocRQMd59PpgWoWnpAvKVv+r2PIz9O0JpsYV8/Q
         SYD5K5xhYNAXsQHLY9FLZe2TtgMQWVi1J4ygiUHH3CZdgqAXu0RpnB5bQ2gZN56IBInt
         o6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010333; x=1786615133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fx9UkPI2/eVI7/G8hFIhX+SVBVFckt785d9/b/IsG/w=;
        b=YZRicTXhlKT5JeBG7gFbGU9gXEuO2jV87cfG/3IsHbuynSSfR2042cZvyvS4n40FEK
         HpjYwB1LWsFgWPRcC2cnm1T7VNFzV/U64lJvEpN0UOim1YV4pSFIpof4zOMBR+uUU+hn
         oG06gUIAVAS0JUoUQFWqAUzdf6zYc2dXAONAcq7RcaUkkkYyZIKHNCfP083008/31Sdg
         BThVlu+idxdl59HHTzYykXfUzmIWMcvL2eXI9iwZtH+n5oKKNSA5QqstY6y4ZQpqOqkR
         qdErCVPc4o5rEaCe5D6T8crG8om0yltni4Q5DRwo+sGhhSER/ZUP0sTFdZv3rYuhSJFO
         zDcg==
X-Forwarded-Encrypted: i=1; AHgh+Rovd4QwRxKIn4SYLu1UoIDO2OGAOkvuaOBnfR6E0VFYXetx0hGS+5z+y+1bF7NSxuTMLGA0KGYG7vj6K5tzMK7L@lists.infradead.org
X-Gm-Message-State: AOJu0YyrjHas3hjtOJKYRIoxM4XRkvBgiPR/1bQ9dLTTw67q5jhBhvcT
	swg2gP+mpRfX7n1aTsp93Nc6wt0IU5+Ew8o23WAMgd1WnYLTr6EXAbFqpQ8eQEFLdm6ACLd5xxS
	OUSBBhtwc8qZHEyorihHbt7HH1iua1vPSVFvIosGpyDdH5BqBYsxEuvcxROtN6X4Jk6I4UaxeXD
	faaQ==
X-Gm-Gg: AR+sD13p/agZQU+ioZLXgjZe48bcSzqnd9o5FKyphSyibRHDaIQ2j/7aTKIMmFb9deA
	71KsfINx8gY58XitdsKUhKxUIjaaTZFHJzwc6x7FMmYSoTW/ODW2k/VCuZTDfWhUznlHI+zZfWb
	wW14S9VbHnrjQ6Rmh/l22SrXp6Tn0Ubj/SLotikHuh2VohkxBQ6X4F2OBCJluOtPOlpdlGIcPS6
	vJwgsVeBB9Jh+LaQeBS4LcfB+oa9IIhFGWWxCNe7SDCFperadQtrYxwXNZc3z6y23nCICM42k12
	XXmpneVplBgJ9xubM7vp7BTF6BiOtzJgVvlIruy86Dk4ky66Ilfr6xsRkJj1bqUouejl4cLoVcG
	HXV2Xz2wDjaHEoTKe49MM2OuBvsbp
X-Received: by 2002:a05:6a00:1f12:b0:848:4f04:87ed with SMTP id d2e1a72fcca58-84f2e0e1b58mr16151707b3a.34.1786010333111;
        Thu, 06 Aug 2026 02:58:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f12:b0:848:4f04:87ed with SMTP id d2e1a72fcca58-84f2e0e1b58mr16151677b3a.34.1786010332755;
        Thu, 06 Aug 2026 02:58:52 -0700 (PDT)
Received: from [10.217.217.131] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e75sm1068934b3a.2.2026.08.06.02.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:58:52 -0700 (PDT)
Message-ID: <53fcdfb0-2bad-46ed-a4a5-519a1495cfda@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 15:28:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/10] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
 <20260804-eliza-mm-cc-v9-v9-6-39067760dc3c@oss.qualcomm.com>
 <20260805142646.GA795123-robh@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260805142646.GA795123-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a745add cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=h0B1KYQZdrYX5eXDyKoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: xq84tzDcghG_h7X4t9HUCNL8jjUNH6b0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfX1HvWe4cXWuVe
 3KKm6HhkVEAj3nxjLNB2ns2zJfe4GBOZEvaR4dDgywhxjSCRzxkDSVYqigMXTmZ9y6DcVOHX9G+
 RDRA8WHH/T7xxyMRaJng/HDLQjyI5kyR1Hl6Dq+O393g3RPhQHpsqDkBR8rab6ejpajs3ZQ1dMf
 8b77+cznyt9SHxVRkp6hm9qPXV7+nCmhSIfHWLvhoKElA+NMkoUTJEPevfRbj3ZgpKQLdnyGXbv
 D3TLfVFmll76tX41T2ouCSylC8F+0MFMMLVAt+H/p29HNtPTEVT1DryHLpjyYneC1uMiPbr9cTX
 PmoXagNL3fj0P9v3jwY5AHHC6zXabGS2Etc0oJHHEucdS/CnmGbhY4UQAkBFzp03NuSq98vUoDU
 JjhsRKl5CGndPqToqmn65F5hQmoQ+nf4GG/ZDiHuscqgtfwOyyz3ehxnIazV+X+yY7WXSbNW/PP
 kcHRtiT9pN7n+CHxSeg==
X-Proofpoint-ORIG-GUID: xq84tzDcghG_h7X4t9HUCNL8jjUNH6b0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfX3y5f/7fMSt+Z
 gJRV12FhAcIDq73QwdrXJ1x7VR7Hj8W7Q3XhFLCUYz6ST2rjQIvTCeOxN/WvJvmEPoqPqr3vewg
 Z4kh4Jl0eYvRMrjZuoTG/xyz9vEpQZ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_105859_347493_43D2DA64 
X-CRM114-Status: GOOD (  15.39  )
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



On 8/5/2026 7:56 PM, Rob Herring wrote:
> On Tue, Aug 04, 2026 at 11:20:19PM +0530, Taniya Das wrote:
>> Eliza camera clock controller is on CX and MX rails similar to Milos.
>> Add compatible string for Eliza camera and camera BIST clock
>> controller to the existing Milos camcc binding and add the
>> dt-bindings header for Eliza.
>>
>> The camera clock controller provides power domains, so 'power-domain-cells'
> 
> You mean '#power-domain-cells'?

Yeah Rob, I mean #power-domain-cells. I will update the commit text as well.

> 
>> must be present in the device tree node. Add this to required properties
>> to enforce it in the binding schema.
> 
> The sashiko report seems valid to me. Should cambistmclkcc be a power 
> domain provider?
> 

cambistmclkcc is a clock controller similar to camcc, I have tried to
reuse the same bindings. I will add a constraint to take care of the
comments from 'sashiko'.

-- 
Thanks,
Taniya Das


