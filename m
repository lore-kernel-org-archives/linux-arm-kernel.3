Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BD1E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 07:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVFzzezC46FreKs2vaAw27DcvUsJ4OuyToeM0qBCxvA=; b=IlgMnq9sCFZA/u
	hZvGKJvBQHXZR4RBYVoRq9nGSBp/zlZrVGq550naMNdkHIt9XlDjvAC2W1jj0vcGtsTpt6K3j6BvR
	RujsmJC12jstmAtvOIzHKQB9Jj9SoKPq82YwOmzIDZk34UqxoiShuAXFhNQkWj21JHRVe77yzWwHU
	sfDz7vZPu9ZcCoCTzUVqRGZpI/FMo0InmOYZyGkJhBmWuPJ3PpBHYNiG/OjCdUvGFpXetJTsMzsOS
	AFStbAiL/SanqWhNg65u5yIJ161qSQU+/o9njqKf5iiH9hOCsQtI/abUiEIcWtXfzd0/FbsxdKl4N
	asl3MWB54AzLJV6PZYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIk1t-0000000Bk7O-2VTa;
	Wed, 04 Dec 2024 07:42:37 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIk0s-0000000BjyN-3DGu;
	Wed, 04 Dec 2024 07:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1733298087; x=1733902887; i=frank-w@public-files.de;
	bh=UVFzzezC46FreKs2vaAw27DcvUsJ4OuyToeM0qBCxvA=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=B/QbZNIau9e3IcVcJ3Nl54NQKWbKQ9349D+UQhhixxb15cGFoh2ADWDcn4hTffoX
	 9+i3sgJ0vqPXyKy8PQEfRGOiAs4jDa8RuZsOUiXYIOE8rguOJJ+tAGf7yRu9EyI6a
	 E9lokBmPZYUYYrD8qnYSBs9w/X0p2gde0afx9uLJ+FplQ9c24JimaRIMG2B0hnZ4g
	 uuNX3NsFug174Zi2otJBkw2f5umdtjbnF3Dx1MIwmeX3yLhFr3yz2Iyu5t2j3Zhkx
	 AYUsm2wQEqweY4AefGlHhW0bfZllFQwpCLZ+P2urjIyHMCl1jW6T1iq5hYALm753F
	 qWLsniJaHCjldIwnSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([194.15.87.121]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjS54-1u3fLB1jb8-00adr5; Wed, 04
 Dec 2024 08:41:27 +0100
Date: Wed, 04 Dec 2024 08:41:26 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Wunderlich <linux@fw-web.de>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
User-Agent: K-9 Mail for Android
In-Reply-To: <iwmnxlqpaijvr4kmzwk3elacqj5ukqlchfs67ca6c6gxrycpbb@pc6a6scqkdi5>
References: <20241202110045.22084-1-linux@fw-web.de> <20241202110045.22084-4-linux@fw-web.de> <iwmnxlqpaijvr4kmzwk3elacqj5ukqlchfs67ca6c6gxrycpbb@pc6a6scqkdi5>
Message-ID: <1DBA844B-4DB2-4AA2-BF04-B3CC39B3C3F8@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7jC8s2s7lVFQtf9IU1byVwhZN2EKibzOoMEEWpGfAWUBTs/5dAc
 J5161Qvl1qdhoS5VoKfAnOBN33EyjxHrWH4MjoC6GZQZ8U6gBod2qWlT6WKUzJ75dr9ZCwb
 xmQdWnm9GKsqIFRiPNZ+6gmvWY+VQ+BVV91as7VkpejWOzctJRtQ1STOW2sohgEZ+JSXG1X
 twiq+B6q6xhymAPyM4aRw==
UI-OutboundReport: notjunk:1;M01:P0:Pbqe7Pa+lEA=;UF7c5YedZdBVFclMVjACVAIYVbo
 AlXP5YkFR242Eo/xRAFUGIZwGvfyu1NDYIhPIexeOa4J1sDFtXjZVOVrsqYsn1M3m+vuuJzWn
 GIOVVpcQ9GXjVZnOi710fEaOk6VQssrzdIte8ANlntpt0xDbfX84wEhxDoCm5QTxW9hItWLce
 xIhh5Zg5bCjKcyM5IgfTwQbkHb1Fct2Y/P17PyAiEXek75e2jUgPFj6ldMWPfGqfSZVY1ei/f
 itLo18elPheLyl0NOK3tSGdqDgJw4WOCcVKP/02EC5Y/aWSlGbwi50amAxpvluRy3xtO9HVtT
 kDYBfDy5OX4K3tbX90ufwVCiH00JT3eWNdwjyW6g2t+Q3wB4n/uVpg2QPOGBRfEPjn544Kd7f
 mVYg/SHQljpb8p6HEeuIClNNifueIXRJy392phSo0brNNm3zsgvDjOixF/pUCzr2CBzGgaHHR
 ekrhhfkMrxGQ20qWQyPA1pr2BSj7XKzcmtH2JIXz8E2skkKgxU2l9WEqwkNCOn88FxjXsqoBG
 uRsTlsqN1KcRDx9YZSHGGbZM4Ia+uvCAZqdvknvtPxLtlYRc6gIoptCGyrnRqVh0AYy+UKUfW
 cI31VUyK0NJn+U0jz67lb/yViIUdT/kQWjZFPUv6HIzpla1kb/tFcGxvy3gYTwKtbpfHI4jmf
 A2tWrKUCZ1nK+TTAVDMAygAJscWpomalt1glWLZr3XBYq0ukPpfdOQ88VxuNwkGhTp+Kiy8Cz
 BFdIRlJ1qcwIcjDmw3Lo2zlez0sNravkZXVK0U0ExY1tKwpXIBQarPVoW2GCeNd8dWH+XP7nK
 yCn7sp4HwB69hQJzSGDfvRC6i0c2D2ZJ9rBZUu4H7jc/6r7yug3sdqQ2T1NkQ0ssvJaWJ5JGL
 ed88jRefP1Jce+teQTGSSRdfey7sglQvWDE4yn2TRKBQphiNdFcXW7MxRTnq7jZp89PAuafWC
 zs+N/j8m6fkTPhV0h0mL25SVCoeNWSRO4aJCl+FXwQANOMLWDplIA/rJZIY2HrchZXW2EcTWk
 5EGvnN3p6nXVKVr4UxhfBTeMP4CAH5MWmgz3KnVB9UFAqm8XzwzUFXaAPVfSqd61TCOjl0Ohg
 H6+C2Y2AwOyO4lv8m8DGhnC+zx4trn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_234135_100199_8E239888 
X-CRM114-Status: GOOD (  15.19  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am 4=2E Dezember 2024 08:35:37 MEZ schrieb Krzysztof Kozlowski <krzk@kernel=
=2Eorg>:
>On Mon, Dec 02, 2024 at 12:00:37PM +0100, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> This adds bindings for MT7988 pinctrl driver=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>> changes in v5 (so not adding RB from Rob given in v4):
>> - do not use MTK_DRIVE_8mA in example
>> - add _0 functions for pwm
>>
>
><form letter>
>This is a friendly reminder during the review process=2E
>
>It looks like you received a tag and forgot to add it=2E
>
>If you do not know the process, here is a short explanation: Please add
>Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
>or above your Signed-off-by tag=2E Tag is "received", when provided
>in a message replied to you on the mailing list=2E Tools like b4 can help
>here=2E However, there's no need to repost patches *only* to add the tags=
=2E
>The upstream maintainer will do that for tags received on the version
>they apply=2E
>
>https://elixir=2Ebootlin=2Ecom/linux/v6=2E5-rc3/source/Documentation/proc=
ess/submitting-patches=2Erst#L577
>
>If a tag was not added on purpose, please state why and what changed=2E
></form letter>

Is this an automatic message? I guess yes=2E=2E=2E

I have not added it (robs reviewed-by) from v4 due to changes and explaine=
d why in changelog=2E If i'm wrong please let me know=2E

>Best regards,
>Krzysztof
>


regards Frank

