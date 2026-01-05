Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE445C79FA8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BP6Gu/c4u72ZuJtLgtoBCZcMdP8EzVQc6SErXMu+NVM=; b=G6tfWXHPMcB3yUAsGLejjkPAR9
	iXB7nv1QI8cB0KNrbLWIY4UpDkf9ZT4rf0795Kqp6X4cRVkca0tri4FAV8OZcWovroP8RfED3F92f
	w3P9lTRG63zEiBiu7DHSOJbAe6Mv1CptueiPmp6MEK7+w4fugH32gUNkI4DM38H4wzOloZ7OJXUUR
	wrnpS1NPh3b/aL48MCg76TwgJl1KbGfEfldlJ/+hnizwnbNUgZwyV8D07CerQdLdGZUDyY8hTGSwx
	rotguwL7lQLBKbtC9dsQJv9JxI1fEuMXjoi8sdbfLxm8l+E74+kGoayGl6EnrOJTGcNBd7Oli+XuB
	1Dpf0fLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoBf-0000000BnqO-2sbW;
	Mon, 05 Jan 2026 17:16:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoBZ-0000000BnpL-1EGR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:16:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605FoYhr1617144
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 17:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BP6Gu/c4u72ZuJtLgtoBCZcMdP8EzVQc6SErXMu+NVM=; b=iJK2TIcElu/UfXQV
	UvzgwnNdTKPmjV+ldOkt+wmncU7M/+LJK8zj7oxg0lQnKO9M3nVatd5QseCCMdlm
	v6Gf9MfKK1QWOptn1ZfV4OUGZGA2OawuLhP1qZo1TY9E493FDAbuSi8QlWI7eVFr
	0nd6Ie6hremkkOfX5HjfV8L80MUEVI2cu/4akS8xssybFVCiurZ2NnXhfUVhV4cs
	jEyavDC65WsZZdtzEGDX/Xw0oQcuXrHVEgEzUIu8UWAEdUn0jX7Y/Vmk7z5v3GXM
	6M1Nk/2oSjIfJIH2QVS+1xTieirzDgWkStxqNKs36epIh5mF/T4c2inJeobU0BMo
	Od8Z8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgg9yr958-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 17:16:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0f47c0e60so2069715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 09:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767633364; x=1768238164; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BP6Gu/c4u72ZuJtLgtoBCZcMdP8EzVQc6SErXMu+NVM=;
        b=FdHLHc8Yr5fBGvB9ZKDuOsdJZpWDKgf0hfO/KZPUC3ou3EpO1BQiCzH3I0lciqS6GE
         zatLpUxHyRZpG8CZ5BNCgbfCQfJlk+cvAspXZkCVAQTYULh4MS6ZX/oneT/MXg4JzS+j
         kl0K+Yl0Uhm/5YOhXu0hIccwP2OKGLdomroBRKIcBRCnTsmkiIOvBMmvRxi+cieTIIHW
         SO9sq6IBXRAr8hPhECYxz55bL8eNUChnCkiu7rCjmjvChttpynT/Qt2wYNeFEhWN6ba+
         2cPpjt0xixdgaPWr89vi2Kshc6udpLEYTnZH3aWKcQKElN2Rtlw9kl/WSDmJX+kWqGCq
         yUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767633364; x=1768238164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BP6Gu/c4u72ZuJtLgtoBCZcMdP8EzVQc6SErXMu+NVM=;
        b=s0QYHtE4kxYt8PWjfMOe/fwPtqD6fFb0x+F3xt4jCotj9ONNW5Gv+0YpvIIvxZfms9
         Xf0P35/TQDPbEL24kAh6NUW21GCEzSM8e88f8f3T7+bBJHWZLhHuPfu5W6gyQOE/+tAz
         3An4nhig0wQQh+HD9CMTXBQY30xqk+ru3RABr5sbrH+IWp22ZqaCufOKgPyMS/o9+QJ3
         qVS0aKcFZV/xmRxfqNzWxbmsW8YLyAQsChia5HN3pGaZ799mXUSgIQt6LJgPDfv1pbrs
         ikAk9GPKSZ39sTvDGO6i/T2vgW4ceyzy/y2sWuE0nOo2KCt8pBKm56dcaXpXj0k5jEs4
         Pb4A==
X-Forwarded-Encrypted: i=1; AJvYcCXspEdHiK6fMcNfj4cXugG8MwPSsbIaT/57b+ZSDD7pVG//T8NO2boQxK6SUt49oL3ldidX+Zp7owj7/DsRLRBK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8AQxB1m59aXMJErRxjW79ez2GOtlY5y4GZ+I+b7c1EX29RNAF
	IElC+OGsFfPf6YmNZVEAdgj/nbjI+O6DVT0yHHF6aVmpQ4tauVizEbi75HdQLX2rVcwKXaY9CZJ
	/z+YOY3eV+LH8dLmSPXCq/J7X4jklD2zTSTJHZz2sn8VUu+RnXvD+n7ISHXR2UoLS+rBYyd1PQ5
	6NNQ==
X-Gm-Gg: AY/fxX6qBjT4GYDxWk7OdUd1bH63YcUIJ3UneXDnmx9BKSQv9vvEMkhsQKQgGEnhzNV
	qQB8fDQGTLSyamVTRqQfCauG8p4V02UxalUGH6rkpLrAiCVv0UHOUe8gJnByfjQuz6f0NaM4Y65
	4qK9U+kUgxVKOPQ9l+UyNVW/c9SpaStJq2j7eAcbGRDrj6zzvV4mlsZYblxkHej8wqLlaWyr4QQ
	m9zjtByGjUtXG4wb5MtrUIaP6HYClRW/p9cFABDOCtKxaQ9tA2Yr2ecPWaN/f7r/u12kJlrmRIX
	fi7P62eaZkvQQ9nSUL2edkBmi5vk1MtenA4kPiuIDK2DK1JR3Se49mwqPrUl/YD9+JXDYA3hqvT
	o+79wdJkrDkj3F4UWFLZQjMkwAw==
X-Received: by 2002:a05:6a20:3c8e:b0:371:53a7:a4ba with SMTP id adf61e73a8af0-389822fca65mr45921637.30.1767633363798;
        Mon, 05 Jan 2026 09:16:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDb3ibB9yyf+XjsFBKFvP7NjPBf6cbuRzUcRVAfkOINXdA704jnRwHCauACbYKxkz5R4nWrA==
X-Received: by 2002:a05:6a20:3c8e:b0:371:53a7:a4ba with SMTP id adf61e73a8af0-389822fca65mr45883637.30.1767633363170;
        Mon, 05 Jan 2026 09:16:03 -0800 (PST)
Received: from work ([120.56.194.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4bfca6fbccsm199197a12.3.2026.01.05.09.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 09:16:02 -0800 (PST)
Date: Mon, 5 Jan 2026 22:45:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Bjorn Helgaas <helgaas@kernel.org>
Cc: Yue Wang <yue.wang@amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Linnaea Lavia <linnaea-von-lavia@live.com>,
        FUKAUMI Naoki <naoki@radxa.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
        stable@vger.kernel.org, Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH] PCI: meson: Remove meson_pcie_link_up() timeout,
 message, speed check
Message-ID: <2veit3krpnauq67smexshnknbahup4yuckjgd6bxqisfqswkqe@dbhcgpiaajga>
References: <20251103221930.1831376-1-helgaas@kernel.org>
 <176603796183.17581.9416209133990924154.b4-ty@kernel.org>
 <CAFBinCAPpiq=M00ZQXAB4Pu2Myjo8gpXC7DByKkGN6Z_Ahqafg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCAPpiq=M00ZQXAB4Pu2Myjo8gpXC7DByKkGN6Z_Ahqafg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=M89A6iws c=1 sm=1 tr=0 ts=695bf1d4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=3dEILRYKsVIWdVk4w2Qziw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6FUes5m74a-6EvCHSkUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE1MCBTYWx0ZWRfX7p/jegG/McNm
 1Rbd6f64BGtPbi8HhOTj9o9I2q9CJxATqmu3KaQxVBGLQMU0VOtqCR3easlGR9M/3zoOfTIbR31
 9mT++NnSrnxH4K1Eo4mHLOVH6e4koUnCxnGle5WZL1seQhnGZWGQEj/VKaER0GFRgFo7Duv60Iw
 P+mSmR+40+zMDOU916hWalfQB1teWoO7pcFymGCPPcg0H7hFrBjZcEgDAVxzO1uuILpbb1GRcTm
 w5MZtsHeETnJhS7THO2bzs3d1QFAkCjfiP6VsML8uM1Kevaca/lNXJtjU1VcpUFnLR+uQo08gAK
 PSsLOJYB8mJ+bgDS9O6U/kJAW0Nn8KVLOxcHy+70fSWAjnb65TKTP5LYKLJNXFCrfE0TnR3Cki5
 FOO4tRKY3ZD5avG+O97azTHH4twZ0gv7Mw0fb7U17h+Ei/rnsOcbRXhCAEdfIJ9tXnl0Bhw/LZB
 C/cR61CcRTeZu+fnbvA==
X-Proofpoint-ORIG-GUID: w0k0yPRdRgSPNt8fJanCsvbLQSPA-Ke0
X-Proofpoint-GUID: w0k0yPRdRgSPNt8fJanCsvbLQSPA-Ke0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_091608_648101_DF81DDE6 
X-CRM114-Status: GOOD (  23.28  )
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

On Mon, Jan 05, 2026 at 05:49:00PM +0100, Martin Blumenstingl wrote:
> Hi Mani,
> 
> On Thu, Dec 18, 2025 at 7:06 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@oss.qualcomm.com> wrote:
> >
> >
> > On Mon, 03 Nov 2025 16:19:26 -0600, Bjorn Helgaas wrote:
> > > Previously meson_pcie_link_up() only returned true if the link was in the
> > > L0 state.  This was incorrect because hardware autonomously manages
> > > transitions between L0, L0s, and L1 while both components on the link stay
> > > in D0.  Those states should all be treated as "link is active".
> > >
> > > Returning false when the device was in L0s or L1 broke config accesses
> > > because dw_pcie_other_conf_map_bus() fails if the link is down, which
> > > caused errors like this:
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] PCI: meson: Remove meson_pcie_link_up() timeout, message, speed check
> >       commit: 11647fc772e977c981259a63c4a2b7e2c312ea22
> My understanding is that this is queued for -next.
> Ricardo (Cc'ed) reported that this patch fixes PCI link up on his Odroid-HC4.
> Is there a chance to get this patch into -fixes, so it can be pulled
> by Linus for one of the next -rc?
> 

Hmm, I looked at the Fixes tag and mistakenly assumed that the issue existed
from the beginning.

Bjorn, could you please include this patch in the next fixes PR?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

