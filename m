Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5237AC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 08:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYPNU7IrXM3BAA5bDt9np5+DeRI7TeRzLYJArUf3A84=; b=YvMbx5fls/FBEAFO5NwauAx7do
	jVnwTsaS6HT6kyDpeYrO5EvHrbqQXwXnOMUu88D7B9AHIgXlqbhNylOfsrpZerD1Xj5BmJ+lWXfIN
	yZV3K1uqAaLkBWJ9eYklqiELjXCZZ/1i1Hlc3GKcsRh+6cz4mQKReD3+BNsWeiwRZCf57LIRByy7/
	8f1FlrrCT10NKrUW1piSQA24v1IUlSuZ2uiMuRqs7oe+XW6ykHHp1v6mnAtBRNtH8Vi0CdFC4Dm0Q
	HeQFbAf2At0kMblHHL0C62YnMqhF2EIRU5uKNdeYZwKtZfKJufDqYpq8B9Ik6IcpH+PqqCeZj1oWA
	e+dj0LzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twGlq-00000000tWA-3L6p;
	Sun, 23 Mar 2025 08:33:26 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twGk7-00000000tRh-3tFC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 08:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742718653; x=1743323453; i=markus.elfring@web.de;
	bh=DYPNU7IrXM3BAA5bDt9np5+DeRI7TeRzLYJArUf3A84=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VIMimFAiNYiWnto0HLD9gvyhH9Teq0oGbpaxVZz2KUd3uAZJ+3dRIb8lZhbyXlSo
	 XbVlSPYaQ46JkHNu55JWfsn9x7p54idTHIHGT3C+uQyYDSXjUDpBuGoLETTq4HSRK
	 3Nx5U0VOAkqJAcCXZcgF2K3TcFnlBj4q8S4k0dKU5zpKnsLiLN+oDxSHQ78gKwbYe
	 jSLDikgNjpOKSL1lH8lY/VrCFdZL4HNKFv+4fHCyzxIjVF/Q558C7Wc0qk+KivlRP
	 66DCXJMxBBHvXJ8kXjbJdQpLjUsBJm4SRcY2jQQz7Ik6abcn8mbGSEuObXrneagh1
	 zrti/qqb1UWxxq4Gug==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.71]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MNwjc-1tY1m12DLU-00MYlX; Sun, 23
 Mar 2025 09:30:53 +0100
Message-ID: <352b3fb3-0acd-44bf-8f69-cf72b5d27e67@web.de>
Date: Sun, 23 Mar 2025 09:30:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] dma-engine: sun4i: Use devm functions in probe()
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>,
 dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Samuel Holland <samuel@sholland.org>
References: <20250322193640.246382-2-csokas.bence@prolan.hu>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250322193640.246382-2-csokas.bence@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Eok7N/ZFTQPH/RQ/eVBr6b5jC0i/dy6yeFBhBmj57IReVHa0aDa
 qbRh06yLzMUPZpKRncmU9SPEssGx7qTPaLN58ZKELTkKtXRah2HhmLxfGLqRP8kASsuZjqE
 YX6u3nQqKtsYrc3G8wAAD8/NVbBcmZxvwqbTdW848BaJ3Cd5ITThEsNw7/+fVitGEU5Pjaj
 LMubty8hVyW9lL23kL2HQ==
UI-OutboundReport: notjunk:1;M01:P0:dAswLujEvUw=;9KVLCGNHyqed/0kFl03BZHn51pP
 JtULO5FjGC71GnLRkuJmDwVcaad3GtJ4sWROV/cHrnK7YVqurRfU2JOMy4wa/qMTUiClKb+XM
 i5dDhKLnihGijJ8rcUtOCqsj4L7Hwd5gV3kfI8Tn2tYl1RxH7YIXUdaw2uWR5Rh/fnzEJEXvK
 F81r6T3K2M38M0s5r+kag2r5+y/blWAzlfaGLM2KZMQbrYIWz7GZDwld0VRqnkQEdzMUtjSJc
 SYpb3O+zoLnvBHzS/HZWb2ly80REu8e4+YDIrGz/VwGpGNyOwEsjWAE5qRx5Dy77TWUKVoJlc
 ULI6XFoiu2Wlj6qaLUIZw1Chh2u2m3Eh7rI+xUWqV5h75M9omCyks454bw7E1o6iqkJi9BXIL
 K//cFsuR/OR3NodNia2/feiIq4anuYEJCgjkaHvoyUb15KcMAzADYR9giYsbVfpOF4MSHPtPr
 /CayK9cXHUdjrE1yiCmB/EeMp8u7IAv7vmGQKi2z5w1RXAM/PndOBUJ1bjjm6c0GOGfNZnM8I
 dlZm5SVpF+TTZPiRlHURFekB7dPJwckgUvVsyoSGMCR2+5lCU+zg5h3akxB7l0gJgYrap0qT3
 rA078/SRxVSZ4+TKQo9JfxQKeFdGvhQlrg4L/dXG+YiSHJHuQA87/Q7BNyBKaAL7P/L/hNueB
 YeIPyne+LcjWdgwbjyoPKnxf0R87h9zjXcXAEHxahhOvQHe6dbtqVFmGH38Yslsr7ZjyOhDnH
 AmTvOWHy/U52vph3+/wvBHKr8IDkji5u2MF0RLMXfoy36/roocdliXxwWWKJ/3kz5X73wsQ7U
 w/DBxqw0BeEQcARYeFvZZ3us2Kfuxf7JUd5OUu/omDgTmMnN8rCmZqhSlstBa320ibbW71OWg
 iQJ0sdevcI8hxxwhhvXLUpP+XgpW4EjE+8olxJt4KPMmDI3pKMWh7XiqhiY/Vga/9Z4sB68zo
 H4f1LWoKLEokg5BUrImjEa5hXR7V9kaMQOTKvBLYJQjGmFOjC9pe1QKz8QMNX+epWUGjYZg2j
 R4LBji5Q9iu56kK7eU4znvoqYJO3gl80PC2EGY9KNbK3F0gMtg0a/V6960lHC2zizRC0YRN7d
 NL7JRaJFD6NRpOQUfibofYIZ2U3Q9+feRQ+7Z07DZFNlKfS7y3b3g7cOmQfLfPyKDDlJ9y2MU
 Tt1clxt3Vzf5C0ifJuZ15d+ai5xc7EKUMK6yEsPDL0wKGQQBEb20E5E3LBzSZqaEghN0tNwO6
 T60z+pO9Dg/tzBBm09OGl4SoBDDn71XfRC/RVj8Aj0Mc9EwkkCmMy6895zcUs/HxHh6hV5uQ6
 Y7eOwdpEsK1uEuvicb+i9S5vyUyEVHftT8+KII2Z2tOB0cKfnUqGFPufTkNCG4qR2VpxtzemQ
 nX/ennEcACKse+LcnHz3F0gozgCj3XZS62TNtHsvZfacf88YpEwxp/bnSL/G+QLmxI4hPIORc
 6/5rd2dDXQkXKBU3k+zvybNZ7oFsjE8VZl57nu2g7H+SOomBx5Ye4ZOTdMH6I8aE/nD+u6Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_013140_281018_62416FF4 
X-CRM114-Status: UNSURE (   6.02  )
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

> Clean up =E2=80=A6 and dev_err_probe(). =E2=80=A6
I find it more reasonable to offer such a change in a separate update step=
.
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.14-rc7#n81


Will it be clearer to mention also the function name =E2=80=9Csun4i_dma_pr=
obe=E2=80=9D
in the summary phrases?

Regards,
Markus

