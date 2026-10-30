Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE020606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3P0KCe+4;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrxmNSFp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lfv6dkGy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1m4Wpp1H40EG28ghxN4iiP4fGlSbQfXytaT04yu47n0=; b=3P0KCe+42VRjBT
	uEG457DLKu/h42YWE82d8TyNNKIgdWSUl1e3VQuPhEFRLxU5LUlIldAexBbtrbIGKeVf2zQDfzSX0
	MZ3NjpaattqQKFRn3FLXGs+VN1NVFe1f3sEBKSPeDDjsa4tnrb9z0+fYIhSAXAVNG75Jq2kFAlUKc
	Tky+RSvfVVurrFMj23yxQzygko3jXQD0DWSCjyITaK5Wa0sCs4LQEZr9c3iN7nXL79nxcdvoWMT9V
	qwRkB2G683wVL5X9X6t9F6oSUNagQ52Qq3lTTR9WXvtk/fmK+u3thRXLy9VqP3+2guuiG5YWCs9Lm
	2W4ecZOduR2rMdm7bNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiax-0000000BCde-3vxv;
	Fri, 30 Oct 2026 09:08:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiau-0000000BCcd-2AL2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:08:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FI8x2733209
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1m4Wpp1H40EG28ghxN4iiP4fGlSbQfXytaT04yu47n0=; b=NrxmNSFp/6jYfrCQ
	W0SKdq0iENifrZ2kakeGMvw1r30bn2bhEUUQwcaZi2jMaXyRSn2KEeBlWXiMzxjg
	CMBUhqWeBJ7gWH4j57WlubsDcFq+euiYsN83xvZtB5sfGl2ybVJ97dTI4b6jz17k
	da8FVh3pzXFrhHJetTbyhyJS35azfqh+f6zDSnZEncEDEqZAn2vEmgz0PIMLDruB
	kKNaA9zygzwnNHXBm0A5EUVxACQUGDOCfxCjVfqUmpPgYFUFsLxGVKbSdoJ+wOnY
	cuwurmhTmVRUKG/+dcf/OF/kEdXmRSFxZZoBAv72JcBVCxd45lRF8JsxhA7ManHb
	Absefw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj535-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:08:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so119347985a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793351294; x=1793956094; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1m4Wpp1H40EG28ghxN4iiP4fGlSbQfXytaT04yu47n0=;
        b=Lfv6dkGy2rmXfm84mA0MZUZYkg4DTWIuswYguVNHUnM2oivhB+ijK50rGhaNwKSOki
         Jzny3xPKb8ZdfMMVk3smsnv0r9JvOL4R2ER7f6BmxC0b19LJLT9h9rkx0owBfX8HWtma
         sW/l4yUYeM/0vClZILg6Ch+coZH/7h6zgfIl4PAC0scv/BIuavAnYLE1qJ+i9iKaKreQ
         qvcxbEZXeuvAPx7nnJL41QIMNbikn6CsqC31VUfDrCdjzAxEmTHDs+c2TTc0kKYRW/Dy
         Bly9a2tMFwsfAtjmolVvBUSvAWEHk/ggW1GdczPj8X5J1Cx8Kh3zbM/ixA17KRfbhciK
         mWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351294; x=1793956094;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1m4Wpp1H40EG28ghxN4iiP4fGlSbQfXytaT04yu47n0=;
        b=j23Dg8wnDzYELXjh5x5fB7eR8qdOc4gr8M+3aWZmGmm2QbSfFC1Wex0Fqta/f1VklI
         CCdbpDHCl38DM4ezPQcKSNbb0fnN7jD7kYYYG/RSWPDV4PvoS3YbQEMJrKUm+evGqySJ
         17MJ9ImSHxIgHFV8AY8bOfTlzWqvo44FtNkYlMrwkxMyBBXocRWTB337ym6Ar/xC25pa
         6563x7y1iUsXfNyJkVkCpTYW8526Eo5rYUNQ+m5TyYPmGRnDVMWRQUOb9M+sAf1v/tKl
         MM5UpXcLUahQO41GXCi4yacIBB9K2CNMG8/9SPa3C31jfF9lDKH9tNCr5nEInZN7Xf2p
         qp5Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8vdhH31HfAuf9QEaWxU156w1o/OcO+deGgzwKJp/8CkkTDJujYoZNZekR32+A5ZNoXcqTT/woHz1xXjXqv54b@lists.infradead.org
X-Gm-Message-State: AFq9FYJAQFNCmTTcIGawpfhUQBt1zgbsSKMYxCYB41ZTdwh6rzOTC/Ts
	4RsOcmqbVFDX0Ni54z9prkKjxOn0lhzG44KjTSpB9j8HyQFnyBdrJVBSuzldz783zcWLFNvcaJW
	yHVB0nbn1+BrsPklMIaR5TdkL8x7IO5xxh94/oUlAmVm4sAqGjFSlADp2nOOclnWm0Q0HxAMq+N
	wEVg==
X-Gm-Gg: AYBFou1RLIz3IGE4il+O3N7vG2LtuEK2measBdUvLcDuSJj0vM17uN3OYrA7PefmiW7
	MUKDgbE3mg3Pw6kMJGS5b63ne7CcJTr3Q/0hK9TZac5qIryBYVZ57+PvStQsqRrdcVBxSxBUMDH
	2ebN0WboYbugT7q3c+A83GHJfYd8CnkF68W5akDQiWzwN4C6ZdOBRK280Dm4oI5uLFv7ln21q+y
	UrR01dc93gbmvDjSOymmJvIbJsT+oR3WLNC1FHGRozqmRw8ftqLxT62EueSoXIEi6+NZJgU02O4
	EG9VOMW4u8C+TYK782rOX77xhbW2vuqsHgW1wfkKDZnlRlJR57se4rjG+VVPF2OWQltwTEwupI2
	Rc67VPqmlWOeHzgWyVTmVO0NYgcc+eg/lt6PJEqFBxlY5FRNy6YyPyh35jQiaAeWui8QUHoa/bH
	5l5aM1W85Th2Yg0YiyVyUwLt1zJtgf+/pm580=
X-Received: by 2002:a05:620a:2709:b0:93f:571b:c72c with SMTP id af79cd13be357-944216b818bmr277395585a.46.1793351293990;
        Fri, 30 Oct 2026 02:08:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2709:b0:93f:571b:c72c with SMTP id af79cd13be357-944216b818bmr277392185a.46.1793351293464;
        Fri, 30 Oct 2026 02:08:13 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7fbe:151a:486d:a2cc? ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm1958499f8f.25.2026.10.30.02.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 02:08:12 -0700 (PDT)
Message-ID: <62826ebf-d5cb-4a94-942f-76afa97b3e09@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:08:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] powercap: Add generic hierarchy support and
 convert DTPM
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sU9VZnHnuwAbQ1tyIiFY3O28TjRxkzUL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNiBTYWx0ZWRfX7TShsJnBOmZ7
 k1ehL++LX/Poq8/2vx0xuedlINlMUy0PDXAyVXo+xgHKc8aKCoq3fxgmmkp2F3057OaC3gcH75t
 rGlWXbTKSKZvbXsKXTVD8GfqegsLuXo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNiBTYWx0ZWRfX1FW1CnMppziL
 NFvgbis4Wg8GWSVtBhDxy4CJttWEOpvd+naJlRqOSFlILP0Wdsm/unlBL7LEARetsUF0V3olQO4
 u6olXXW8Vv0Ctv1tZfGTDKeQHQNmZihATP235K3Lp3bGAmoXgaepCF+TC+GWHt0W/8yylzEisR3
 l27prIsKrDRWgK27nhrDT+Za2S8hx6rKE97RTIl3OiYLlsOzXmWt5t4gHVzMBmgq3dRYp0eoQ+u
 KNbr9qd3AJFqN+2FturB7vUYPsYIwx6qCfn4d45LmBDTKvpuwUktzPPlIOUt4liNaRGObGXyLxe
 QtUPdEclRF0Wq0hBW9lIvunfthlE0Kt3NcsF10iwNPibjqMFbQAgPddQcjKrdhrjXwuy86GeW3Z
 3sgiNLMI0AUMc1lfAd9FU+vyAjazS6fWVSigfpgIpqWuVJ2bVpPbkA1J2c9XGUOpSRgkUJuqceT
 XyVAweg2eBx3p132L3Q==
X-Proofpoint-ORIG-GUID: sU9VZnHnuwAbQ1tyIiFY3O28TjRxkzUL
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae45e7e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=h4SK1RYChiWzJ0aczLUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_020816_679339_C3478729 
X-CRM114-Status: GOOD (  15.50  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi,

On 10/29/26 17:56, Daniel Lezcano wrote:

[ ... ]

> Changes in v4 (since v3):
> - Rebase on v7.3.
> - Address the selftest issues reported by Sashiko:
>    - Add a kselftest config fragment requesting CONFIG_POWERCAP,
>      CONFIG_MODULES and CONFIG_MODULE_UNLOAD, guard the module build with
>      CONFIG_POWERCAP, and skip building when prerequisites or Module.symvers
>      are missing instead of failing at modpost.
>    - Resolve the kernel output directory and pass absolute O=,
>      KBUILD_OUTPUT and module-output paths to Kbuild so cleanup works when
>      a relative O= is inherited from the parent selftest make invocation.
>    - Keep the statically initialized mutex in permanent module data so its
>      lockdep key does not point into freed module init memory. Retain a
>      separate init-only description for the hierarchy duplication test.
>    - Return KSFT_SKIP when powercap sysfs support or the test module is
>      unavailable, while retaining failures for actual module-load errors.


Just a heads up to say the series passed sashiko

Thanks

   -- Daniel


