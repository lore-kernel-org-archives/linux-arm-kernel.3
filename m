Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1E8606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=slfGLnkr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=H+4mKs2t;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bL6ph9CU;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GH+M3le0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGuu7mdTe48tzVj5UIBCGFenVGFbZZDVeQNujQoibIk=; b=slfGLnkriPxRhkNcEK4GuSgu4W
	BnWoZivq8PJb+61+qe+rh2UZTAmDKWjLk92MgGV16mFBJabxGfk3P11x5pz3nwfC4n2in8jEWwMIX
	ge4MeMLudW5lIlLHqHbkZEq5m1ZOTN43WAKkJ60Ts1869TOidmpEQtvwg/uDgIkvk69P8BqrZnmuA
	wt3kB0vcHLzx1TzX875ZTXBDCfXDCNnJznK3l6p2k3YmUs2IbOcQeN4QXhSGXrp5yRprwM6gii4ze
	BGiMGuvk4Q7CbMVgE6iOK9ERQsvjhfprCyJ3xJ7kL1Uxt8X/MOD0uDruluYxSjKmgGiqfE5GMtKYj
	jedWKOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTf7-0000000BcCc-47Hv;
	Wed, 21 Oct 2026 10:35:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTf6-0000000BcCQ-0wJA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 10:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qGuu7mdTe48tzVj5UIBCGFenVGFbZZDVeQNujQoibIk=; b=H+4mKs2tjRvQ2NxbIUs9tlvr6v
	Zenkr2a5QPoia5xptvTHMrL3wU5eIe0q4q4BAvPt2zNN/aMD6AzT9kIZQaOnBNY3xCDTvXzgSOC0U
	bg+JhTKEMtEFevAuKcUnxBPEt3oUx4E1NGJTJhaSgMIoxXp4b9r17GtLDpUjMlEx8aY1xrghnZeQh
	dCdCvmSj8CumSuHx8+btRELum7q823b0X+Gs2mCVMqhVwwEFeuYyO1cRGjVai7SvYckP7V0mJa782
	EqDOJtKRpD9lSzOVSftFojl4hapP8YO2zw4GCG9E5SORjKyjsEUtgf79EEINr7W1YhVIldev9IxSC
	CgYwjfhw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJTf2-00000005i1J-4634
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 10:35:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LAJUrO1422119
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 10:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGuu7mdTe48tzVj5UIBCGFenVGFbZZDVeQNujQoibIk=; b=bL6ph9CUm1kadnCo
	jss1z55EW/pdqxJcTXajq0aPpwZRRyDUXw5TLiBJ+MzWUHSYayJsQC9aTtwrERBm
	84hylA/dv04uC//3FPxvauvVZjxTP66amQSgvQjlrvYZklzF4xWprryYwEHxG2L6
	4AxjqxOtg74iUSBvOS9lTNWT+Bjz/wV3cwpuETXKKE6JiZEJ28sYxQhshstao5DT
	ZcSMz+8MJXMfDLdm+hIno27dvphFjfEvMxBW9khvGLK+jOTVb+bHdWt2jwkibax/
	bNTEQ6j8Gqm87UD+FLsGnAisQ7BS9GHd5Y/pTGZI7lh+EOoNQnu+yrBlc9pgqOhB
	pvuBuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhug1kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 10:35:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso8859285a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578905; x=1793183705; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGuu7mdTe48tzVj5UIBCGFenVGFbZZDVeQNujQoibIk=;
        b=GH+M3le0JMYGpC6vMrkoH0AkYMUIenrVgzvnkDfh99pwMqQ8zAH/bIyQcQ4v1n2gFe
         dlA7E5zVsCKtJ4f8SicVPYbuvBbqlTanb+EiCgNXYqqox7RMdqrqJOhN9zKTQYsq2uOg
         wtzig0d8ulUopUnxgnLqjO1EK4ulQET261leYOe4oLj5c5T+V4QiAaYK+NhwHYh+wpY4
         nu7HLAeM5j1Gx4zjTGegm8V8m0ze5wmSEQ9JBtiiM5FCgYez6U3ubUheuAtwj1YFwR8T
         t1r8KEB+31I3ZhdhPobU2p21GB2MMbRUgc4iS1pZv8QbNFRDH8szyJYQB4g4MSLVauWp
         psfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578905; x=1793183705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGuu7mdTe48tzVj5UIBCGFenVGFbZZDVeQNujQoibIk=;
        b=YyiO4JU8XOSJq2KZ3uTcNszVkqDVZSspZ4+GXx6rDbkH1oDhaNTUZLKl/B5INUQo3L
         EevnnJ1gpzE0xq6eR1NvGAhy1UHCZA6j2rSX78Pr6VcJON/XLiPT0M5cOnoe4VoRthDg
         BVTwua3f4dIUYbzdilnJGa8Z9vbY8sATh4Pqb2gGPHb6yd00G1q+ZQ/45uc2puJleEoB
         2dEwv5DLkb3iqiQwwxIUoXBwDCJ7hpli0TVWPJOKNVWkfywZuOTiufrL62VE1sQntXeL
         A6yRhU3Kejfb8upsI7QkHgfNgWj8fvN1hi7fJN7qCiLv5BUknEGakM7s3vSPK8sn14/e
         DGqg==
X-Gm-Message-State: AFq9FYJtK8oAPREtnMkpt7if6J/4vO6jpNM0wyxXXtALrf9nfsZbJYAS
	VAI/URKpbm+avu8+NZCa2X4Lxrv9Wsgo7JyT6HZCqpDHj/1u89lzeRfB+l9pJ8BdEc8gj2FZqkW
	amTNfW9r271ZWyDONFWb7uvpgdbKQZ/sp/uBpdzwH6tMU2J6qTkHSoyn8fKvkHBMjdwQdA8ALoI
	0Pfg==
X-Gm-Gg: AYBFou2ziK3GJHoPBn1TWJ6dFpK1/8m3kHdu0oAiT1qTbV0L1TvksKS6ZkWE5MUIFuL
	Y5LjIQt1u2TbB5gXpGSOfo6dWLwXKNNF/kWamfE8msf7/wdfvzZkLwpkvaiGvgYWI/TwwBc/kXp
	V4qz9Dxcp891r9LrnhaJf8DpfKig7/aVb4HkL3gimzh33majC5mK3cOUnwQSGw1FLc+oNByDGdF
	w0mfDpvRGAIqoBiCePZdIrkQB31hT0LUMnKyQR/9p5nMU4K4hQut+zIJ62GvGYTkZLVgzjT70Xe
	xY9fwyDL5mhZdT8UrHwaU28GkNVKps7sDmdqU4eo9JA3hOwS/YVP3/HBjTX98u9vvW/6HHqx6ye
	Suf5kvB5+7JHckt/Db7aD/A==
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr366240085a.6.1792578905288;
        Wed, 21 Oct 2026 03:35:05 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr366236185a.6.1792578904793;
        Wed, 21 Oct 2026 03:35:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403132037sm647584a12.26.2026.10.21.03.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:35:03 -0700 (PDT)
Message-ID: <26d4788b-fa4f-4f37-bd9d-ded731fb1e0a@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:35:00 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Skip suspend mode switch on
 MSM8917 and MSM8937
To: Reza Kurniawan <imkyufie@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
 <20261018-psci-fix-v2-3-35f65b59eb9a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018-psci-fix-v2-3-35f65b59eb9a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8955a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=J5tutDk3-wnuWQUDz_8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX502/YmbzXGO0
 cltvF/4g2/P++T3wz13sgsrN7v01eQq4EYG0xIsMgoukp4kNYyFB5abtW/yo2hg9aLV8qWfrb+T
 AQT23+rZXVBBXSWzOOy7m/lO9o00AtQ=
X-Proofpoint-GUID: KVSs84ajw9bqPWu6fJt9oKHxgJoJqpdW
X-Proofpoint-ORIG-GUID: KVSs84ajw9bqPWu6fJt9oKHxgJoJqpdW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX4lhMLtCNP7S9
 +MQM+L6mSVuRXZxDHK+62YZhLEfOeTw6+mt89v6DDmg0b2TVy3iL3ECmrDZF4h3sSqzEeD1DxIB
 wtwG3VnonjIN0W3m7yeoVgmbKb1aTgTUIlvgOoTzEgW7OtKjShoGuWp2jY9ui0ZeFpxadpeJAVc
 zMGt1DKJHEvH3GfV06EMX5JTKDA4WktSGPPSFfnPxuRJXfoYBB97O/XWDvKwwRJ0k07H7AFXrbd
 4EzkOoWZ0tq1E1Xa8ikMTw/2SK8RZeIuB7ixL5tvbjSLQoq+PTHot81kNyhL6oyv1NMur0x0UKk
 KXstBbMTJ5edC7SDAD5tow4S1/6c+TrmLlGJu5iSEIhZS/Uxeygt9b7FQW9SLi/bxH5QJi/19j6
 rB6oyS34H6sjdXpKtjVsMfn3/EShwZSGYlHkes5fwYQw+vM2UGnFnNso2NCAxgEMDYPwDa2XMvx
 /883r7qV6RR06VGU8Mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_113509_640719_5C3094AD 
X-CRM114-Status: GOOD (  17.22  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/18/26 6:29 AM, Reza Kurniawan wrote:
> The PSCI firmware on Qualcomm MSM8917 and MSM8937 reports to support
> OS-initiated suspend mode but rejects call to PSCI_SET_SUSPEND_MODE with
> NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and
> probe of psci-cpuidle-domain is aborted:
> 
>   psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
>   with error -95
> 
> Skip the mode switch on these platforms and continue with the topology
> that was already built.
> 
> This is expected to be safe since it matches the downstream kernel
> behavior, which manages the cluster power level in addition to the CPU
> power level, just like Linux does when OSI is supported.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


