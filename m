Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E91D26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3gsNK0n+kxqkO2O5Y6qJa7uNbEWU4OWP81Jtn3Gl6I=; b=XF0Gs9hV4kzRZrh4uHDg3HgUP0
	hMgi85K0cbfRmEB8W1cccxeYUDI9wUaZJc1Imd0KXTPixpVhdmlh4gSPhhH9ToGG/mrS0sDOqq27y
	U9vM+43hOUfQOCNvpxp+7BgRJTZfuv4Nj0pwmANafYBPXgWWnsa0r+AHNS0n12R3fLc+K42jR3sX+
	crQXVxcvNVmcgC5MFdSMwWhCWk6DpGq7cy8ij8TivzdpFPHR+QHX81Hp7KnUL7krCxlEA92CXYBg2
	jGaB3LVIKY7xYolKOlxlCNl+VQqpDfC8Yk7bZINdxAO3ldXrVysSMnZg5/DAsH67LeBHhmIQDsq/P
	65yvPKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFLo-00000002cPZ-2nnX;
	Fri, 09 Jan 2026 16:28:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFLm-00000002cPE-2KK7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:28:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609GO3gH1637719
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 16:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3gsNK0n+kxqkO2O5Y6qJa7uNbEWU4OWP81Jtn3Gl6I=; b=auDnmJVWhcQf3oJo
	JL8uymCSt392ezuBs0Va51CYfLzTl6z3nmOrLbaPNCD9V5fdp9uI9qEzkEbGPjNh
	MaGwhl3q7S20hU6QYuxJmTjplPXXWtCfnxBr6YdZhZPa1tDcjd3UXJm+bmBVa3TP
	ZM8Kvv04KvzfF4/M7lao8pCT5tYCBgT+eqmb32TXIC/aSB9ZH2T73VlzdnTs7e4D
	5CroGhjDBWNwddLxJn4Fq+xHJiFubZDrTFCVBTgGcUwWUjZH6uStAA/joNU858ll
	uR+QDtLW6Ez1/GIdI8+yrqOfGK4pxnxcqljH5DMgN2qFPORVl3ck7vK6VPaqBZUG
	s9wtPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bk55kr0cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 16:28:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c1cffa1f2dso870693185a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767976113; x=1768580913; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t3gsNK0n+kxqkO2O5Y6qJa7uNbEWU4OWP81Jtn3Gl6I=;
        b=f8I7pRRu4hPI2w0pxlANRBamYZ0Ug1UJ6lyfqp9nbKxr1xcprXPpAI2dN3hBq4LEeJ
         aITddDdhuunIHCBUj+t+YemgRhsNEFq2Nm67vkWgQl64bzzH8PFggR3THO0piTEneFWp
         NdcRn5N0nv0G+5hX93Eh9D/QZYeCfyvUV1ybdl3Rnxg7k0Wk4JTCZRoEtgSM9i13Waq8
         qnPunIMAPwRYmStq4UFlKuTQ/D1QdEY14n0xNPxlgAzTp37vLyNnAlFZ65LVeD5fON9J
         +ye2r1HICzS3I1KVCNcz2mdFkgKJVY3rel7GxooeptCkzDqk566ZvzpORO3xhKIERfbW
         u6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976113; x=1768580913;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3gsNK0n+kxqkO2O5Y6qJa7uNbEWU4OWP81Jtn3Gl6I=;
        b=IFZvMgKnBYcX3ilKGqEK4P0R4rkTX0s91daliu54KBPSXcW4LU/R+EHh3D6WjIJYnq
         c3iQ+XgxXXsXj3mbeVOVtzPbD6oa+qsSleL9GwCCkleq9wJrDR/uu7nI7ZfFEAx7bvK5
         G2ZKQ4OLrGofBg9arUn3RtBpQgDeOJKoP0sCLugSbcqVA4jKqGzPB+iy3KNkDJYecAYu
         CcJcBHy7XgYHUOpAsJzNKzv5XsXSTC/ZZOr5RaWYrtzn6FeBTzrsC/xeMN/nO7D18h8P
         qd1tZv5btyHN/Sb1uJl96oQNjTgu64GGoRXqjrZwio07OkhQ3S9GUWPNWAuta7NWfFPU
         uToQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgVW/tOzy4K0AtFKech+hrd22rbzkcHyZxFJY1XEU9ls0wbFDWWVIt6etXJK4KqYcuiEuEVPaaaq7XfeIUjNQ0@lists.infradead.org
X-Gm-Message-State: AOJu0YxWWk0xixugrXdCo1mWGMr6SpuGfZlgq59e+05jNbTB5EDLOHpa
	1psfjHVlvtbVqkk8u9dpLTrQJJP0ErZb4lbmm0E3DNAc1XkkHQrtUFhpD9PERHnXq5OJRkmL/zx
	D5VtZCIjWUhdURqp67TPhEsExC/c6dTyZp8dxmpbUQWNgPfVacjC0G08D7FcXQZv2qZOLOV90DD
	G5jg==
X-Gm-Gg: AY/fxX6aLJR9GdHP3agGdS3W2FHwxlra7/ebTx32UYgSoQ2EY4MZ5MVca97LnPC0vuk
	ypvcaLBONqtUueA26YNgJaYzBB+zozG6dDu9jUIPFEMOD0JfkYFYI9XEKzdBcs0y3JSYbgGIadq
	Jxp1dP3IPnM8UQacaBEv1WmiLXgE2li0G5br7wh96yVWde4MD9iqeNTUkXYOcnPCommfwq/hBmG
	4BRSv4QEdsHTykYmizVl4cqkXcXrAwUZGa64o2hxqKorwCuhZLxJF2FVLn9s1ifZAFGL8gOIl8g
	lhs+hdZR2xiJjwwOcD3c3jYEWcGQ8h6XD3DQvkyedYhrcVpQMxKhgeV12L0R7TEKZWeqTQs1bNU
	9hOSjpxRw0o2thV5bkSCvp39oXIkiIw5IQHuhDQ==
X-Received: by 2002:a05:620a:4806:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8c37f51e983mr2081063785a.28.1767976112641;
        Fri, 09 Jan 2026 08:28:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFjr6Hlo/f6CAeSmB5peKaZZkzcXVDt14M9nd92QHPuF7V/gxrWpBy4OmUEIvthc/Tse5YQw==
X-Received: by 2002:a05:620a:4806:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8c37f51e983mr2081046485a.28.1767976110721;
        Fri, 09 Jan 2026 08:28:30 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f84besm70896735e9.1.2026.01.09.08.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 08:28:30 -0800 (PST)
Message-ID: <c7007179-77af-44ee-ba8e-a16310fcc9ee@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 17:28:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] clk: imx: imx27: Simplify with scoped for each OF
 child loop
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, llvm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-7-24e99c177164@oss.qualcomm.com>
 <20260106102146.00005bfb@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260106102146.00005bfb@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cpCWUl4i c=1 sm=1 tr=0 ts=69612cb1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i0EeH86SAAAA:8
 a=TgEtEVTGrOTdQsgPiu4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: eCD8Z-1mI-W-B3Fnk0aEmZGMdIDFiUwS
X-Proofpoint-ORIG-GUID: eCD8Z-1mI-W-B3Fnk0aEmZGMdIDFiUwS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyMyBTYWx0ZWRfX2Xvur7CJjwIC
 ASezSXa70FnNcylMArVh8f958TsAb/xsWigMGE9+J4A5qhI9HG8ZUutVnr3iZeRys93JFV4OoOy
 /LsJK0yXGfqcObyeIkcT8cD8FZfEvb92UkzPHJRh6npiNx/Lp3pold69cpj71Qcl9c6mWtNGi4J
 y/nwttjplSJLQzABOI8tM3D7uhrLU6LVYn5Mz5uaW9LpFiND1yIhfsDKeTDk7jnRFCvA+nZ6eWR
 WaYs7xRo8W1Ht0YZjp8KuytN9yC1WVd7aP0OHuc43PhOB7PrsWLPIXfiPogk8R0ldmyUchw9Jsh
 IBqirePG48K12p2/FD5bWIL8/veDSSLNf/eg0KC3ns7Saosccn8deUFyXtz+zXjGceKdOk2E261
 uidh/uH0vXMNQR+gbNhqOv6xuyiy+UFb8YBK2ZFQIN7aCjVzLLYJ+tEiJA1mFrsocfZjiJW3AcB
 +XRZTNMxk3uR3LulKyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_082834_641495_5D755DAC 
X-CRM114-Status: GOOD (  15.07  )
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

On 06/01/2026 11:21, Jonathan Cameron wrote:
> On Mon, 05 Jan 2026 14:33:45 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
>> Use scoped for-each loop when iterating over device nodes to make code a
>> bit simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> This is one that had me thinking for a (short) while about what pattern
> required this double match was there for.  A comment would have been useful!

If I only knew. Since day one, both DTS and driver have and check for
two compatibles, so this could have been simple:
for_each_compatible_node(..., "fsl,imx-osc26m")

> 
> Ah well, nothing to do with your patch which is good.
> 

Best regards,
Krzysztof

