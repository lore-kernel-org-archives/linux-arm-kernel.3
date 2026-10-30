Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A88606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s+T7avgk;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOg5RBwV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SSeGceuf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=; b=s+T7avgkl7BjWX
	dR9xGh4iVtgO4e5ajhFZs2DMwdFcEoBQ9xU5wweImiOGm9L1yp4xudWiyUgOurpVvPk18aLjJ18ng
	QdmGCPOuC5aKRVVHvzvpeH5jAsYXpxpAAisRTrpSTHyhKDxacF7RnN/M43Dze1nOf84c0pCjB+GQk
	NAnIKEwJxX1ne7MlguRDeJv+g5UUU5SLpPJOnk+hxOVBhNTyqlMz6ZDPnWaeUSTUSmdZFIK1lB4TH
	pLAxmwrtAfZoS/1eeidjc7ukaNmYo5ZCEIGsamp/DBUED8cbBAVUjBdvuNDsAPH+CXxjiMH2wLWyV
	DWq1f1d24vv+efd/FdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqCi-0000000CDJo-1enJ;
	Fri, 30 Oct 2026 17:15:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqCf-0000000CDJU-3uFR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:15:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERCjF3564383
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 17:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=; b=gOg5RBwV3PekfPEO
	+oPNR0MVxk61KNp0EZqXCjntTL7j4cVnSVzh7z3b9qxaJWwQ/YhTjpy4PWVFXxsk
	8ofXm9Ev2QDaCKCRJ25ySsUt6Ld7Y0MZnUaM/dpFcTXfVq/ktbtB2SNXbFtEgZVL
	G0phIgX+21A2uq2glFvBM/JAXw6P7FZLJtzmdHRCtGVpORuCcknmE4OgOw5JtLcr
	FHYGSxMHu2ENa9koFK3nCZACjRCEwathVg+HlRelK3XOjRG5GqEGdT3+dya6XfnS
	hWRi+3hpz9x/oRkNoA2lis9X0ApSlHymkCPdxOPcquezvNHjijLBzKBg/lRtPUGM
	fygoGQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm4rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 17:15:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so1780280eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380543; x=1793985343; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
        b=SSeGceufz4QK/8hf2t2XYdlJbeiXls64mlmOUlhRsjJfee+p3TDifqxh98if9CSdSn
         /INC19WBlFGqeqe8+bMyExlcBcFhv6xB//U4nvg6BoOnNSeIMKCNb3Js526XaFdE58Ph
         D7rGlLvQxLdrUrQHK3xEjRsotNs6cTurOeD9pWcSZjtuWhxg4PQ3muHGct2dKHNrF9i1
         UffKvN766xSukLOgrPg95fLqS5qExBkQJAoQiizNwNAns8MpQ+M1uob1k/8ZBlJ5UtY5
         4hFGBZMWuSM+abBVSKLztobkRYUqdpXJmwGJNimwud2MBhjyh/bvuNpl2uAQwvMPfzK0
         Aj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380543; x=1793985343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
        b=iO9zXMah9QQRixlU77ZRUJU6iO/QRjkMLOY8+EhWVQokt+05qrfNLYXAxrY1fgLnqn
         yzMnPqoaBGlt72KEFvGBjfzG0q03nNDMGMnTtBl/GGLO35svcsjaaJHpLm3XAL2EPZhw
         kBaALHqZ5k+L6/+SwMhCSReF94tjQwFG0q7iD5nOb6zaYfQFXEah6Ta6hqT2DbsqcBli
         WKn0VmDypPOxKXRvhCaLXVgTG5nyFkV+5Us8xixWXRY2Gj4Ib2z/hAVLUX5M0d2MonHe
         PUnXEE4ZnuHnx7+mkY5HNQkAZ99XQ5g4dUDBs1DCpTwrZu0mwB7Ycp+/FxZ2PRNHPP5B
         Ih3A==
X-Forwarded-Encrypted: i=1; AKwUvBwEcFnXXFYe+MUA5yznEedhw2t2AWt4zDLniumHiipTROAxdEBzVaZcRqpC2TMxOSDn6gTLrpj/l4mkhTnjDS0l@lists.infradead.org
X-Gm-Message-State: AFq9FYKfSv6v/SKBiCUYCDtW5KrL/Yfsgoey60BljZG7Rd3v9BzTrB76
	Hz0pM0tSUl8bq04X9QN46IgfqP4QsiHLLfpIbDR8SM2c1MB53pw46/TqF4QEXQcrYPZFZSbD/pR
	qv7kX+ACW839i2mPX9lyk/409hL/g0slb6YptahA34aj+EsVJoX/WTxtDpJQYezoGO+okShn3Wp
	ualg==
X-Gm-Gg: AYBFou134fWO3c3HZS4muowNhVRb4wQEWEAJH3akZU/MlM8netY2ZhSZFvuZG67gLez
	fOf+sB/CjPurG318flSu5BKVtu5MqYiQzf/VcziIeaFwvy0PW+DrLZbdlWKe7L0GIUEe9/PMTxL
	TQxgKAyODCzoi3n+1k28F+ObDUMXhIADO6IamIJzy8X6VpY1a1oBZzyy5rt2QG2bymI3JaPqCaE
	x0I7eKiMQazxiA7vz8rOnAEg5uV5isit5meiSZw8QDDRoCKtQR+Tp522zD+QLCnPLRSGHX/PpAs
	mFBP0mSnPE7qRN161pYDIJWU/qfozV83vx9V/bX+okGUeja4SmHdPmABbPlfo64kedP5cfcPu6w
	n3qy51V85wYCHYyPZyqNML+CGDKdM5Pjz1F5XYPOCR8EOFLp3eyYJNBQ2LwkXUw/4EDe1+/eb6T
	wxMLWSd2qEWBnGSkZ2S+1txSCgrd080HLejpUKFBG40CQm0BtBTKlv4Ah+HyJ97L+q
X-Received: by 2002:a05:7300:a188:b0:35f:4780:518e with SMTP id 5a478bee46e88-36a4238996bmr6833694eec.16.1793380543182;
        Fri, 30 Oct 2026 10:15:43 -0700 (PDT)
X-Received: by 2002:a05:7300:a188:b0:35f:4780:518e with SMTP id 5a478bee46e88-36a4238996bmr6833632eec.16.1793380542666;
        Fri, 30 Oct 2026 10:15:42 -0700 (PDT)
Received: from [10.50.42.16] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm8607711eec.18.2026.10.30.10.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:15:42 -0700 (PDT)
Message-ID: <ba4afee7-5c3b-43fe-9703-9cd42e0fadca@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:45:31 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
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
        devicetree@vger.kernel.org
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DBAXAQxAdYtgJSE-PO81MK0FyA8YnxlC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX7sptcQ48HLfP
 IewuooWhxfOjHZ9F+JnNN68pvWGZkaOwTRarasbtlXy314YnH0fz3RkPN5OWI2h3e0YdNHgKrOh
 oMzM4Hb2ZCyOQ3kJmuvOq1qkRbs/g8Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX4pjkiuEUp50M
 Xxr9IAnP9qUAQr8UXSRS+PWw5OzIhItpLIPJq0/Yv6m2fUQNZIR2xSwe1vou1S+Ov68vDxQ7/0X
 YBhPlFlvKS4XTn+HOwk2din1/x1lRxzvASlB9kJw6mycOYvPIUXBWfHZrCI5Ut72nOB9aOI8x7g
 SBFRaYlbGuovwRZZYKlBVaKoq2AsQKppnr+tpWJaS7nszREObX4lL1HY134nFzdNYaU013nuo2n
 GOmwRTxmMViypDDGsQjM+ZiNLXnirl3diCDXJR9+C+i2VmEnEbows0jIrYvYxicXQvpNQ40Bd5f
 743O8HzFINgjRSdspDzZ+1UrgPsx9Kbd2hvlE0NTQJ3r3bre6ucE9N+Q+lIQqUH4hKyyWZqebwg
 o1ZCwBKTdcxovDdB/rcPRV0VtWczBYfrC8C/leJbOVCFwqV6Ncr/VnCmDm7jbfPOcWE9QiFlG3i
 e1eRXl8DGWc4SrCLtGg==
X-Proofpoint-ORIG-GUID: DBAXAQxAdYtgJSE-PO81MK0FyA8YnxlC
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4d0c0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=-Elna7LzL5zmvItKdG0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_101546_111069_31BB50BA 
X-CRM114-Status: GOOD (  19.97  )
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

Hi Yin,


Reviewed by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>


On 10/28/2026 5:15 PM, Yin Li wrote:
> The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
> which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
> is defined as 16, so the check should use >= to reject index 16 and
> above. The previous > check incorrectly accepted index 16 as valid.
> 
> Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..347a5a6d6a1d 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>   
>   	lockdep_assert_held(&mpam_list_lock);
>   
> -	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
> +	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
>   		return -EINVAL;
>   
>   	if (test_and_set_bit(ris_idx, &msc->ris_idxs))
> 
Best Regards,
Srivathsa


