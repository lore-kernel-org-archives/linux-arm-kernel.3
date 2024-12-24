Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC54BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SikwrvqepocarqAtdheTF7sn+Pq16j1X3OGUSKnRGzQ=; b=KZmfXQjggKDbW22mn21ySKc1DV
	G7sFwEwR6kOKCGJG+P8iF28hgqX2A78qn34zdd5tLIOKURA2ILQ4ub7h5+ZDyN3rh8MB3hphGY/sm
	h6xUfRqD/4qjEdGsxm2wAfO59Bw+T1ErjuBbr6BMsvriqFW+oNnL7y4YizQx9KVdUkLMTFkV4XBip
	z0zrc1glZHizOhqJfChfjkJID0WUWBg8zISzRSfTf/jqZe2TAXO5VhZVgWfINqX5+BjxD8lRI7i++
	eTJc8K0BVIbQTj5z0iU6VtDg8Iv8tYa5V59onkQxImtxtaVaorpXSujShQcHBUux7Qb7k2mYESGdM
	LWiixrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ7VD-0000000CGsP-3Rs0;
	Tue, 24 Dec 2024 16:11:23 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ7U1-0000000CGka-0uAx;
	Tue, 24 Dec 2024 16:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1735056604; x=1735661404; i=markus.elfring@web.de;
	bh=SikwrvqepocarqAtdheTF7sn+Pq16j1X3OGUSKnRGzQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=R20YAwIaRdB4cybp0l67mnA9MrhENVTIo6Q63X8ej2LJmLm8DpT0ijJh5rUhyOel
	 pxElDgDU1+PQaH+FarcPFGDY2JPYFlEn7dv7s2xwUaMFG1+dm0+kQyaYITNH/DXTR
	 IcWa9VOmBtxqFVbJaKcgJ0tZe5483ghz1tcsme+g3STZOGOQ7mzaJfdoJYe2FYhGx
	 DEW7DUwmeoVfAhrX2T5FK3tgDdf3+is8Fwwqjk0TInDzuXEdguKXTPTnZDC4GVToa
	 lWKcPoNRYAoAFMAUGM26WkHaYDbMY4Wb2Q7YmEarcQZ4/FsKvK+xn786oxqfEXSrP
	 aqGF9ybNybbB1mvJiw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.70.78]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MgiXQ-1u2Rto1sFg-00fKeB; Tue, 24
 Dec 2024 17:10:04 +0100
Message-ID: <8a5bdda5-5e2a-4b73-91a5-849b6060e7df@web.de>
Date: Tue, 24 Dec 2024 17:09:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Karan Sanghavi <karansanghvi98@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Shuah Khan <skhan@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
 <ck.hu@mediatek.com>
References: <20241111-uninitializedpointer1601557-v1-1-7d03668e8141@gmail.com>
Subject: Re: [PATCH] drm/mediatek: Initialize pointer before use to avoid
 undefiend behaviour
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241111-uninitializedpointer1601557-v1-1-7d03668e8141@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wwXFHOL+rndON19bU3EG1IfLGvHbJBJd7inIjYIugf2NhmMqb6U
 R1R/rBD0UHK6pwy8zk/7+GIdiHvkKvjOModfkb8guBPJRxivUtwnYcmZa1F52pt2rKs4Azo
 Yi2DjvLpUxcdCUxxZBA3iUnW7f9QPiIPeN1+1cPzc0FURyi1o+iSu4nYhFKkjpA6p/jviB4
 kfZJbrzroQ0B+VkBQ64xw==
UI-OutboundReport: notjunk:1;M01:P0:S5pLRWNHLTE=;HrTXFPU0JfRlQkwFTtq5Qx0G2G2
 CgQITP+3XJiTSrnPMN2AlRwj2LqbNwD5JcJCPMKzIS/obzPrOI5k0aHDcTgfjdu0FvJa+RIr+
 Yur4nIMJn4cobWbh56rVUPSrbs4KkYD3cOyg7EMcxZkyDZZVlCe662fUGE1s7rdtxnPQMVL2q
 tts9CRn98fVYT3ptoGG6yT6mc7LsXaFtEzl4i0yfnvsQ4XA7wVVQ/ntl0pMZXQKZHCA3wI6MP
 IyXCZTaVGA5qZc8ANSsv6GIC1YLEtLttG8CyRLrWoHTGoztdRFlVRdLUZloAzKxlZFHR298FZ
 4E+irVczPijupiXScpqUs+Bh26Hr4RPrKD7edmWh3JdwHsadOgrV8o75SZS2SVD8bxRkLaLoV
 zkEtmSDWXHv3gWq44xUvC4HQEh8FkVJ6jIQ29CXZGz+coyBlIy09RxN/UGZQ87esiuAMKfqKR
 oSiwuuSjxXC7js+MnT5bILFMGPPJC7A1/aBPveJLHYbnp0VfgBLPovHx47SqjZbtXiKSdWQkD
 R5Bp22OR45mDuE70xFpmrApS5IWSUlEoxRZ1642c9qXoD0i+RAfr6Wdc2t//Trs6IocFh+WUk
 dcerWb4i3X1lgEe1XVrhW0FgPloaEBwrcKvS6jpnWtAdkPs7KY7aTNAuMgMNqUjhgNrBWsU1O
 4gpNJ1y1xuqGOUkAFFTIdLi6SRh1Byqvj9LgyfBFk2FUC0J4IMFTN99d85wMK1AyjH0r98b09
 xb3x/VX/hnnbgUE1Oxcsg91m0QLtkR+pagUxaZ/Cqw89fv3qNzyi130hQA2x/8q2zdsQG7Xwg
 4edJU93UOJQnMHYKIGH1VaMlS+127uQfsNeHCoYZOANymM1oOUWjDTv3MF3dyU62ODNSR6q3A
 0oYSVFfqSz3aPfvCV3hQ3frllZmNjiR5VD91WC8UeHrq8GaeyfGl5o6R+tfhNkKJuqG8a5ST8
 BqVJXrQ4+wfdEkgJWQ+871Ok9G6nE+oKnb7Wh98NDjsVUwqKp81zMkBnpwzDmzIqqvBRx5duK
 t24gcuhVSL6BtEqOKgcL8/dkRVhFCn22sMsEehyrhlo2qRhNpmcqvTsuB17U141wVmo/uP9c3
 RZ7PUS6xc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_081009_621622_473BC6EF 
X-CRM114-Status: UNSURE (   5.70  )
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

> Initialize the pointer with NULL as mtk_drm_of_get_ddp_ep_cid
> function might return before assigning value to next pointer
> but yet further dereference to next can lead to some undefined
> behavior as it may point to some invalid location.

* You may occasionally put more than 62 characters into text lines
  of such a change description.

* Please avoid a typo the summary phrase.


=E2=80=A6
> ---
> Coverity Message:
> CID 1601557: (#1 of 1): Uninitialized pointer read (UNINIT)
> 3. uninit_use: Using uninitialized value next.

May such information become a part for the final change description?

Regards,
Markus

