Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBBB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s96ZFOM6;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bI6s7Wzt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d+1VCEY3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LztxLNl/cxBUH5XhoVCY5HWh+124EuWqYRgWVaTkemI=; b=s96ZFOM6wdPEnV
	vekiHagMhvnA7IS5Ui4/kR4OfRL7Pu04a2uXCN6wIKoCacoSoyO5QJbm44kr4y7PcrMHfE+P3Xt4Q
	My+OnvZZbsl4A0PADPyqvnuHGV80dGlrXvLbYx4hM/HemoSy2VYJSgsnHEM4cRHJi6jtk/yup+BOy
	RJFi7pBnBDp95vIEVEZOLZVcYDQA0TZym5gvXw2XP4GNWKDOl6U1+XIRF3ELkkvlo9/q+ysiyQL/e
	iV7SZ/Y5gxsPd9m6AJdC/9UGpNI1G8JZYpDyDK3IX74z1i8QdUJkGnDx/u2RRwwu2KOL739C5lT46
	vJxp0L1uwx3hC5Hx/wdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqFx-0000000CDeJ-04cb;
	Fri, 30 Oct 2026 17:19:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqFs-0000000CDdf-2m8Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:19:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERJAx2596868
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 17:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LztxLNl/cxBUH5XhoVCY5HWh+124EuWqYRgWVaTkemI=; b=bI6s7Wzt5RY1O8qb
	Y69aVd5U3HUS7vWVvI6035fPSKCxFs4pl12z2tNrlwnTS0DzHG9oh3pYA9QU5n25
	HMZLYfzm1wv8I9qA6/SaFgs67DiB9TwTpsARVffqccqUyIkOiq16GikcqKy/3ptI
	/kxY+kekfRSso2oTMGsyVcFlkPxmzTp1DqpVNHqlo2grOnza6ZAib5olImyjtUxz
	hxZr1OlExF2aO3+qCsq0+fW+eYm3Bd7FrT06/lOS72KMk75nLSGCpPtxmKMhYyP6
	Z9BNKHJ9k2xPIMzpJAdBZnoPmHE6KrLIkUyMrQ1D2EAxm3nd4AziX3uchjhXWlEN
	zJn8Ew==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pc6ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 17:19:03 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-83edc5c5ae9so717929a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380743; x=1793985543; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LztxLNl/cxBUH5XhoVCY5HWh+124EuWqYRgWVaTkemI=;
        b=d+1VCEY3EzUs+OQqIBxNQygS5LEzm9IzmJulnAb+HveeFtFU7q8/QrN9arUc0A16C7
         gXYddgICsPp38+5/+9aPirc12r4s2w40f0PcgqBH5kciqbjbVZePrPeOCZe5C82Q3CzX
         /eG8yocmWSfvWfeKSne+DKWucp7m9BhLcZXCXDORWGNoZRxu+TrVOULI7p/CxsegkSit
         FWQP/CXkNGSIC3KaS7UJPG5+i6AFJFc18CgN7/JiNNsZWqF60ur/6Hu58IqxUCpPoLVb
         1SWDgCfCB8Iy0cJpM8O6qRK31COwBC1bag9hqGz30mRPJKOuTp+83BuPR7bvklZIUvxl
         Gl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380743; x=1793985543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LztxLNl/cxBUH5XhoVCY5HWh+124EuWqYRgWVaTkemI=;
        b=E7ZZ+P4yDawCyPUTl5a7HyrQZcAKMkp4bQwAxk7g5Ffnr8y99N3Y5C1OddwgTgj3gZ
         eULXV5263f9NUbVXuXUiu2OJ/F/yi/g8jG4rZfZVAzGaRgN2ht22K9kzgaJhq8M2rdTb
         t7gSneQ9vwpRjpkSCHOoOVE/fNGecpzurh62dyELrbEFIoz30CBG3hl9FnEo+WYbNHw+
         YiuB6IXGsXKUOFmvJfgknYlSY6NmHAIAmDSsH5bSOjr+QSSLchHaWEKFQp9jvaqF3l1y
         DlP1lW+dWMnVje69ljkCUrw/PpUswNslHSBW93iR+rQvIPJB8lbASDlfQphbytlAPohG
         mV1g==
X-Forwarded-Encrypted: i=1; AKwUvBwxcC/rtcA0X/d8clAYRpiHw9m5hUx8dZWGvVZ5cMuHzwqV2jdoU3nK5nY0DimAStWh0hg6zz6u4mUW2tcBJoQJ@lists.infradead.org
X-Gm-Message-State: AFq9FYLl+j8+p246K/McI5udM7GatqgrnEQ3xVsTh0BOW0FhNunBrXaB
	aL0M7YoWKO7sPg9+D9DhoHrzt1t/3Dg5HZlAOCAXYScVwklo3uZbLRqO/PiZbgoDyYChR8d7nHN
	PzGmy70C+ynGV94BZNjRH9jLW6MV+xcNRxSTSH3NxrB0wT2LSK3wVpyWYiFJqExF5vqcIz06T9f
	wLP5sERM7pQg==
X-Gm-Gg: AYBFou3Fk0g5pzOQSYzjSge3fLWKv9O1JPe4OWQyfaGAwohpPSK6WaR2+Wi98LdBSBg
	gLNFmQyktzis+vsq07v4xlVeava5WGhmyHRz1FIJfu6Q3SRhERnkF7RKx7fU6PEGN89Xz8Kd5zV
	+H7TJAErQHkqVK9yA9sjEeVidbmqwbT2zpfSfi1RSceB9MgEjMoCB1IJ2k2uGE9+k/LJCQn4Sx+
	ZUrXA51WnYZvEMyeyNlWAKF91gFWmIEqJaylLnRA1g1BemS0v3vb5btLiRRbooE2P4X87fFIuaY
	ggJoxmy3USjUj6paWCYlQznsVGuYwU6OLvCxF6zu0BnXugvZVLk+IMX4kSciqEmIPpesjr/f49B
	iXo66yHP1wpCT7Iu7HD+xrNcMhxbHCrl6aryv9++/cVl1R3F01Kjya20ctcVAIkGD8S2j005L6Z
	0Bgm/WrCdAFYkUCFU4qMA6Pm/A1SMODhLipLA+QNqnNJGyWNf1wCXUxeiHa3dmCisE
X-Received: by 2002:a05:6830:43a8:b0:81b:c62c:b63 with SMTP id 46e09a7af769-85d3654bc97mr2516123a34.18.1793380742794;
        Fri, 30 Oct 2026 10:19:02 -0700 (PDT)
X-Received: by 2002:a05:6830:43a8:b0:81b:c62c:b63 with SMTP id 46e09a7af769-85d3654bc97mr2516083a34.18.1793380742316;
        Fri, 30 Oct 2026 10:19:02 -0700 (PDT)
Received: from [10.50.42.16] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d355295fbsm2491106a34.25.2026.10.30.10.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:19:01 -0700 (PDT)
Message-ID: <11d12057-11ce-46dc-8310-be660838515e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:48:48 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] arm_mpam: Fix MSC MMIO window size off-by-one with
 resource_size()
To: Yin Li <yin.li@oss.qualcomm.com>, James Morse <james.morse@arm.com>,
        Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini
 <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX8iDwwzmpW2Hl
 BEVYRhV40gX3W9EJJPLsC8cs0ZQpsLCV46ydCX/i7mZ437PS8U9mP6UoxDbtJVAv37ZGSX3O/ad
 qMQ4CXvjI+v2xVM2uP1YNyNuKlM0rbpWJARVO75WysxhTzN+kpizy7L4umrMERyaRnyfsQFXL2n
 CG/SP8Q0m4/f9GrHgkZsaAyLUgFp9y4AnM2soQxsA+wZsZnjPZuRWgSbNQX78ISHfDt2WBRQpdp
 73wdsBYrDkT/DrRdgkNG/YRH0siZND/adyk7XOaoaH3m1gGn/ahJS9Z9hU44uxuoPSs1XJn/w2R
 uurc0FJ/m30lAqOyQ/1lhp+lsWu7zG90FEy9LgoNhZ5w6y/nWtzIAuv1HZ8UKAIGROkuNC/IrMv
 dTOj2KgByzTvZ2LTJvjqS60VQQNeQXRL0Hv1JzJwfmVEVdTSA2sRiCjD7NlSqtejDT61CUT6raS
 XWEVhmYnR5EKA1xUMlA==
X-Proofpoint-GUID: OsXUxR5UgHJUJDcIKdsVkdFZc050Z1jv
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae4d187 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=lcbwfqp2WOkoDi6s_FAA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: OsXUxR5UgHJUJDcIKdsVkdFZc050Z1jv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX9CcTfr0WUkVu
 QK534nZvikH2ZdRXkYaTLitUXNyB8VUB7zo3fmuL76inwbK+c8P1cOWPVVi9VI1ga5kn7vKWZSj
 Jq8h9G4CoWRzQV9Y98M/yBAlEvMptWQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_101904_729870_9F3F4BFB 
X-CRM114-Status: GOOD (  24.33  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

On 10/28/2026 5:15 PM, Yin Li wrote:
> struct resource uses an inclusive end address, so the window size is
> end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
> which is one byte too small.
> 
> mapped_hwpage_sz is used by the register access bounds checks, which
> have the form "offset + width > mapped_hwpage_sz". With the size one
> byte too small, an access to the last register in the window is
> incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
> access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
> 0xFFC + 4 = 0x1000 > 0xFFF and falsely warns.
> 
> Use resource_size() so the size is correct. The ">" bounds checks are
> correct as-is once the size is accurate and are left unchanged.
> 
> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 347a5a6d6a1d..0f984fcbcae9 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2508,7 +2508,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>   			dev_err_once(dev, "Failed to map MSC base address\n");
>   			return ERR_CAST(io);
>   		}
> -		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
> +		msc->mapped_hwpage_sz = resource_size(msc_res);
>   		msc->mapped_hwpage = io;
>   	} else if (msc->iface == MPAM_IFACE_PCC) {
>   		u32 mpam_fb_msc_id;
> 
Best Regards,
Srivathsa


