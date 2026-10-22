Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61014606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ABZUry0M;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qk7LeKmg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e39Ao9WI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=; b=ABZUry0MMtiwAo
	AXhhAljVslNqRTTBsOpIUKLwBp9Nuq8Ig7YWYZXCGIIsUhpLjwHS/89l94Qql8mzXDBOLe7AYZXYV
	vgQiD/iNmo5/DZY/dkgl2ZDyIfh1WbHLWio+2Yv8bQmEiPyrbmhtRHFMJEEXt16bkKxuhglsqUFvE
	nNl536VjnnPxdzCMDs1Z2FBEhvupYfIA1NT8ZC0EBjn/Fzvu2vRKboUZuvaGbT6MgePW0TOe0FPxj
	WLMh0sKki47PjgR6tTjkC2AW9U+QNPfC47somnSWT6kB8J5qlHdxjnBXsSvGNzCtTWkFVMa4alwNr
	bfk1Mzvu7EjEus7oZ1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJru3-0000000E4TY-0zbH;
	Thu, 22 Oct 2026 12:28:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJru0-0000000E4TC-46cc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:28:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0Ejd2397067
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 12:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=; b=Qk7LeKmgKfl8ASss
	r/S31nkFb5YhbcmUSm5td/BECe5v1/SgAUKL+3yoqW/lRibA20tcdz8GOCTejfBg
	SJnhc6mDE3oLYQ7nfvuFZ8AOxYLsPwr0r1E38ln8TXP18dG+8EWHGPBJlKfBr3fE
	VcGF4BIJOrqH5FDylxqT4Lq/KDCj1IJpqJhG5yfK7/MIdqpE/fgqBrq9Q/nILTw1
	IzY44rprRytmIoIGq05urfI+V3wtpeFQtS4HFrD3I/HhyzSUlG0u+Vhxnhui2rLv
	qbPfovCQT1cJYHYgXzKW0O4anTJTXMj/jGOLvJ/icvRKkqNw4umV6qAIrYgHlM58
	W+/f+w==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bu6b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 12:28:11 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-82322894f5aso1222985a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792672091; x=1793276891; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=;
        b=e39Ao9WIfxZqNB7lHmiVo6Rh9OaBVtk3II58mqoHM2bWhGP1efILquv+Qb+ygICsrk
         KgqIB8CXbqrjYIh5u00VQuTmkK+2ieEvRJpWPAFVdyo9j1Te1NE8Emkf3yOplCFUWqpm
         pmBk+Qiwm8cX05HrVm7gh5my2AA4ibTk+VzakNmZFN7u6GGMFVriydhiG7EC2B8TrReF
         ksxQRIlG9lPCEuN7b90y9/uxDWg6ke4vPHweW4SGvKw0TAW7Wz+k1lzTb7MSu6P+oXpB
         GLA+Gbxm8fcHHQw4TdNlbMvHId95o0LgZtx8eseHboO+DwMslPH8qO7n1KzSvqlkyOxX
         XWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792672091; x=1793276891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=;
        b=hQ0K00izG6BKeaOdI+5CBQ4no+ftzF3h9Qvd/ry8Db5CN4Mjg9iKG2Qh8nmji2+c7W
         8azzavTDsyg8yQnejZyDPTIaTVpLwU0P0zfIejbISvUJH7fSBADnJomb1bqLWXw+JM0+
         CaZeim3le5TEv8+v9L2NsxwrkIiMDcfaGitV8E0l8QmYJ5WwzYYkLqlxDbctH7owqHfT
         Ni90cdFmKALSAn3NTAKnlLgXMj5WyaEm8KbDA4bBcANXOwPOKC1YspfCNogS3vdmCPDM
         9Gln9d8TyIbPc6YK/Od8H//7ZhjvQro3pmIYZS4q7wqs4xF9KIRg9rwkq5pDG0wZlAws
         S21Q==
X-Forwarded-Encrypted: i=1; AKwUvBzLeg3Vp44NxiQ0h1fTGSZskahuh2pJaHnN2OCrx9vXsQOQb7l5+7vqvsje5rMshgmXO7knGSCQP213OSkg1+xt@lists.infradead.org
X-Gm-Message-State: AFq9FYIQGicqhqTSq9RE3H6vYMWDVprMn9Fsn9mvK4lqnatks0xgT1Kt
	OdRhtbTH6QsHzfhruiB1MZFrdfWOwqVpU3IUGoXtldFunUAahxwGOqKWlW0/YMvSTe31DHhpwn1
	8usufPR7jAIQIFoCtlIxpBaTtKCxbCnhxma0KoP+AhDY2M0gL7XicD19ldC7SSLqjuzld/jH7Vh
	biQQ==
X-Gm-Gg: AYBFou0y98BE5scgTHw14AEYGtFEALoIQ73kXkHscokNZM5JCOzUJ3CJgkunBJCyY6j
	fvSYwMpRtEuN3mlJjEJWTBNwKjPtWSpJOLVtZFleonBnIEax1nXkf/lnBaolQZTFnf2kKnOmvcz
	HcihurZ3lTGtuosqCZ9dDlQC8Risq83sKc3KG1PDoTnvhda3Mq2mBuxlwFu4B7i4AQW3zMyuPYC
	s6gS5BTdhp24RIV6O/N3lGh9ag6cqAW8YfHXAVEJt5UdZSfUsd3PBl3DwlYHE0yEDFaY/5S6I1c
	kc7Ajaai28Cn9uvGwxTWueEMrL1oXQv5Q0REFEwoSnWtSBaQ+AqrVp8esQ+FukJqnBM/DjwQlEA
	TIIxOZ95Wi2R3sCEPmTNhBPFN0TNcH0zV
X-Received: by 2002:a05:6830:6f88:b0:7f9:555:1def with SMTP id 46e09a7af769-84e30c31e32mr1258622a34.11.1792672091185;
        Thu, 22 Oct 2026 05:28:11 -0700 (PDT)
X-Received: by 2002:a05:6830:6f88:b0:7f9:555:1def with SMTP id 46e09a7af769-84e30c31e32mr1258609a34.11.1792672090792;
        Thu, 22 Oct 2026 05:28:10 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbcdd9d82sm4892517a34.10.2026.10.22.05.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 05:28:10 -0700 (PDT)
Message-ID: <d6a3a783-c6ec-4f93-83ee-ce30848917d0@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:58:00 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] i2c: qcom-geni: Vote for SE clock rate using OPP
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
 <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-6-5da1096243c9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-6-5da1096243c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JOm-5JuuZQqhzme5exFa7Zb20dHS_nom
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfX6XpHUE9oG7M4
 5ovFrFnv8FpDXtIuGN2kXchaRIRF3o1LbPjOF5Ho/ALWt6lroI9MxxNMxrYYCQEC3lI8bZy9/76
 Gd8N1lz4e5q4YdDBwt25obey5mM0wcI=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ada015b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gi_f2RLh3HdMVU9WvNgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: JOm-5JuuZQqhzme5exFa7Zb20dHS_nom
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfX87xTR7ZhtPZK
 k93VHUu6PTmgkkNMmketzwA5oVdMfy7DrT6cYoH6ouT86Ryy4cpKAu76k2eXpktcLEgRO6+UXFp
 mWd9U/09ipKbjuXn5hQVhZ9dR9SLqafNbbemeagm9ACsZXmICLX0GUVvzZ4UbFXjbMSNLMLx5oi
 Vy2Zo6Ean+PT2g7S2znvG1l6ScYM3Ps3ivED/XP3DB5z81iBLFgl9Zte82CfuSdHcgQJ9//oyic
 XCyOOnTnkIUQzaXxLKj4ANq8o/UFSsK53HqZ7CBOExgImqFJ+2fVV3aQcmbC4GYWfIuEgj6m4+n
 1oc8oMWerXK7+ouCK3+JuK0FJ96ijwCIrTqKae5o/+FktuhwqbSbhUsPzpcm2WV/w7fJ4u9t4JC
 /9S97bh+1Zt0882qNGZfXBJ3GzUTnc63cP/wjIY0s9SBuu7ZRv4zyYAx97AxfAxfif3O+sYHVCG
 a3xCZioEag/NkM93sOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_052813_142878_50886316 
X-CRM114-Status: GOOD (  13.56  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/15/2026 6:28 PM, Praveen Talari wrote:
> The GENI I2C driver selects a source clock based on the requested bus
> frequency and programs the corresponding clock selector. However, it
> does not request the selected source clock rate when OPP-based clock
> scaling is used.
> 
> Store the matched source clock frequency and vote for it through
> dev_pm_opp_set_rate() before programming the clock selector. Also remove
> and restore the vote during runtime suspend and resume.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

