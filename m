Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6A6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bBLjxbQt;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EqjFGRzf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SuWvDVd5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=; b=bBLjxbQtnUY1og
	MzgeROABOaLonYmjFCZdht6uhmbDlWvA52lWEragI9bYWkthB0NX4/Kcplgbmd0h75gi7k/xi2sCS
	FPHSz0VCs5VrTxlxI0D/31bT5cXEQ03qwBZdWu5zlVnxgDenAVTYAKtjBBMGQxwPWDtQ1zsQFcTGe
	ghaHREshgHGMjC3ucInxHGee40oimrxa1069TBopDE6KFsjZKr3urVo6LNW2vIh4bWzOHW93tsYE2
	lI9hrmdwfU6WoVfgR8874abSTNoaRxuIj2cKsK6jgpZc8xgh5QKHI8lxUL0F34HPxfURKmTvOV6bh
	BeeAernI/xXajejIbJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnBl-0000000Bok6-3m3T;
	Fri, 30 Oct 2026 14:02:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnBj-0000000BojI-1hwQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:02:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDndCO4057663
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 14:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=; b=EqjFGRzf/gwkWbvG
	dqk/FZNrc1/HzxTW59nTpZrbFLdJeiJBsjVGWy9qKqEwiue54I75NBcWFtPBESfB
	1k+rixQz1SHx1zeBKvTdw5NX9owTe2RCUnpbM1NaUFnaO6/ZmD1pxDJJq4Fsr1sO
	TWmQjwSZ9DIrSZueS9Pdnmc0HypoPmfMlkB4hNDSgbAWHvpTL6qsjjRIQErJ050k
	VYS/qFtDXPSBXDJ1shKgsacT7ssLaH8bQs61yqUiayHLmANTOg1KLKdxXnCTcYcT
	nRXtg/VrvWMM6Zqok4PGXJts2pKVFsV7MRXzJUM8tg+zkCsOWDu8w3VCeU7J1Qhe
	jBqEfQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qub98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 14:02:33 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec2ea00c42so666557e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368953; x=1793973753; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=;
        b=SuWvDVd5JtP5lW+EnnShhWCnwKFUJvwvIgOGDx7YjMtiE7FjPccx6n2ZIvi2NhRUl3
         XGu+/fkqyCwXjGgqOXfxjPIE0xqXF6wmVP28REw2N1u8Nx+D0TZCO3RQaXFQKODSBO7F
         h+yYt41SGwVmCr+fS1o11VA6m8ZnnW7VHl/8S4QHW99j9iQKPkFuvTR67uD4sBfA+bJ0
         lNuw+2IyEiOGsUzTtiz8+Cbx4LGNKj/UlCifGO5QNAWkSa6esAcZ+UA1Vj3pnFyFLRpy
         O1LWWPpgYiNqbZXx/9vmcwpUM9EvCP8+AzlZ2h6vgzyzDIPlWKfcFjt5U4Fnq43FKLgO
         Nv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368953; x=1793973753;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=;
        b=pDTX7kuhMMCqFJiuVl2RLMkJpA3H2ioxrYQkbH/0Ol4B6GrLKI3Z9rDczN+dKyE6oa
         gvksKO5k/k44Gl7+a/nuJ8INPHJSzmelc1C4VkiGO7Uf+iBqYvjfHST7iJSPXXck+Y2r
         +q/snqqEX8FbPN0RAUhVCcR3RjkDODpaJZ2db0PeCDm//GmjyFC0vUE34kTvskAH/rEE
         a/eqCyK768oZIe6fMKbAkkF9HJT4MXuy+jAKwm4IF/n+Fi13TUMefHWgi4FNnmtNhcwv
         PyukGYM8oDN3NnC0Mr5HI7AR47ll5b4BmiWny4Hoi+o+pikTcRAwH2rZUhXy6PhkYvg4
         CNjA==
X-Forwarded-Encrypted: i=1; AKwUvBxWJfRkRYX8Pc3AlZRb4qxjaOfn2evXTjvaeJCeRcEfd1Hrc7YCSI0xZ+yIQSOmdGt+75K/kI7VkuncYWe/we4N@lists.infradead.org
X-Gm-Message-State: AFq9FYKEZFXR0Bmss4TqkWw5NbqJ2sj+20u6oz6ao/mMCQDk0+5ZEJLQ
	OK4ScibdHOUTi0IVJIvdVSbhvzczzJf5CXMcQk5L9FFInW874rAutXTe08FusqiIGw4u9TXJTBe
	rgSLeFAw0Z3LP6eaguV9xo3k1EFOXvbH5WpetKPJnEexjXLD/WzQIDd4tTd1D8HTE7od9J726ml
	4Ixg==
X-Gm-Gg: AYBFou3O8+K62Mg0nGr9WTpXpmELQu8/cu5X6SyAhNgIEo9vf9p8bjikgBoWJwr/pKo
	0QU/ngXwBgeszu+ZgD37PXZTAnFI1e/EX/S0jcx/5YMVqbfStpluU7sX/2DUuo6mOCBxmqabFr6
	eZ04ejQaK04T1T20cFhfYHdTifXgxRI6Mc0EHbXaalLJRTSG38G1mSUbA6q9gBd3NBXIDWdwOp8
	Q3f7VWtG3m2OLuYGHIccDgZGsOOsEqLMJNXWKwtj8bt/Z/umNpDHXtFQYQ+1Xl1rlQNOqWITzs3
	d7GDSypBOtOX4+ELOGKhMqZVs3+1XdD1/aTulGE9VuasVc/HiVai/psIhSScFkqyVZVSnHHYgQY
	043VM1mHPiSQ1JF7LpZ00xkDNpvE1q9iPgWdpPsaFNqVk2ZDNVGq53fS5SpS/bR7xX51LaUR8md
	4=
X-Received: by 2002:a05:6122:3115:b0:5ea:ca0a:374d with SMTP id 71dfb90a1353d-5ec587af5eamr1870650e0c.17.1793368944512;
        Fri, 30 Oct 2026 07:02:24 -0700 (PDT)
X-Received: by 2002:a05:6122:3115:b0:5ea:ca0a:374d with SMTP id 71dfb90a1353d-5ec587af5eamr1869535e0c.17.1793368934913;
        Fri, 30 Oct 2026 07:02:14 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e719eec22sm3808245f8f.0.2026.10.30.07.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:02:12 -0700 (PDT)
Message-ID: <256cbe11-86ae-49e7-b7d6-0b0eb23a79e5@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:02:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Thomas Richard <thomas.richard@bootlin.com>,
        Andy Shevchenko <andy@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andreas Werner
 <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261030094515-afbbbd16-d834-4ef6-8910-e936476ea018@linutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030094515-afbbbd16-d834-4ef6-8910-e936476ea018@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZIus6JymyYmawNvYSbFh9E0441kdfmFn
X-Proofpoint-ORIG-GUID: ZIus6JymyYmawNvYSbFh9E0441kdfmFn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX7nr3aNxGjZhJ
 9wejhXUZpgAgxhnpuPUFIzTTxw1SMwd1oLKd4j0yTl6vTLqwXbEL0zRUCtXsIVGq5qubfBrRut2
 JbpDoshPUJ0OyPxMhRO7fkJWIl1Ts5DchPO4Fqq6EYufXWb0n7DJo4HRDiDiL3qkx9ymg0LBJPu
 cXV1phKSUp7ixczy4niP1Kpei3MzmRVmH2f98WAQQsA0qP+i+/drAEPu53lsVNWfhx2urH1P+i1
 NZJY17vktecIYVYrHIMxComQLDa/xEDEBKbG7DT6mWB3etavrVy1JxDc103wHpw0ZzT3Nj0ekyv
 b9OyqnTCb5QkZs1rHSLTy0CnIyszeZXq4UFvjQGit+0HtB0SVZrlT6e9a6+INa9AXy2CXiboZ2m
 vNzqXjpELjb6kelgETMBu5Eacg25de9gD+lAi3Kf2ITQethV65yoEr9ijr/0oKjiUlCPIJxf+z2
 6T7Latw9XIxKx182DIQ==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4a379 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c-0_0CVZb4FivoHw4gkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX0yu/5GpgLocS
 wb8sCG1MJoM0kGzLLUyHJoyVY2WL57rD7zgW7iDE5sxQkNzToN60XsuMU/5miFb8M23hS7iegjE
 xcHyPcEfFwXSdvu9P7+FAlS7UFh9LSY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070235_556795_79650B35 
X-CRM114-Status: GOOD (  11.99  )
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

On 30/10/2026 09:47, Thomas Weißschuh wrote:
> On Fri, Oct 30, 2026 at 08:11:38AM +0100, Krzysztof Kozlowski wrote:
>> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
>> can be constified whenever driver does not modify it in the probe.
> 
> Looks like a candidate for scripts/const_structs.checkpatch.

I think no, too many false positives. 1/3 of drivers modify the mfd_cell.

Best regards,
Krzysztof

