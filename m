Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5FFC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GUMbfBnqIHCDnl3z+oX++PW72s+Imflt7F3hAYeMCo=; b=OTBM4ECxIeHRNSRgsP6uKnd4/6
	RDBjrbaCops+h/H7q704mFltRHVm2l3PWGki8e220l6U3YcdUg3sn0GydwHSRlxI3K2jWdYwpnkG6
	T7OsGTi3Ejo3qGCq0Gsg9YJTi/uOuYeIqyp03tzWIsXpzCpRk6D9VqMHHutm6WIHsaqLUbZQocuq4
	c/ge3qTFKgBPAnBj0kMI6hv7VxyBsvAjBon1Ig3Qgd7Oqu0ukG6tAVwhn2wn5EQ+gdRxlhXpMpjsY
	HV+8gax0A1Q9dD5Hka+niFQ1GK2OMMSEoPq56rcvfxx5VSQ/Ig9CsPXSZ2zwOBm23UdrvBm3LAaUd
	6Wg5R4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHSa-0000000Cnmb-1pJ5;
	Tue, 05 Aug 2025 13:12:08 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHNU-0000000Cn58-2o0x;
	Tue, 05 Aug 2025 13:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754399208; x=1755004008; i=markus.elfring@web.de;
	bh=9GUMbfBnqIHCDnl3z+oX++PW72s+Imflt7F3hAYeMCo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nrD8lX+cv2M24IWj+axNGJqsHncwo51pw43bNyD31V02rUkhBP9DWGZn6XzbXsN6
	 DmzQPGq6r1du0/er/ZqbZA+6W66rOuqze2S3ArEzG9TRbJKnC3vH9KehldOJPeb+P
	 RBxmzUuDDihilBw3yohaNlR/FKk8QbLvoTnOGPwv3Ku5NG9qVIdW/MRIPRAQXUHZF
	 Kr/+xF/rDS0+1Zwn4lBr/TseiPdMckCT1VApd9DuXpXW3rzsw6I1STFG1zmwyB7xi
	 nFgykonpe+sU3QWt+P8O3u3FazLGWGlLZmh4Lsn7DLxr6ubExkhQVyTM0qM1X6qCc
	 HbublSi3RwgZUvy2Pw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.245]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M6YJ1-1uhNZJ0iML-00HBKB; Tue, 05
 Aug 2025 15:06:48 +0200
Message-ID: <9f0b868c-47f9-4c98-ac99-86bfbc6a432d@web.de>
Date: Tue, 5 Aug 2025 15:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qianfeng Rong <rongqianfeng@vivo.com>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
References: <20250803135514.118892-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH] media: mediatek: vcodec: use = { } instead of memset()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250803135514.118892-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i+ctfpUnk9v+OA93ozPwWFRQ1HMHTONEAOfCEr6ki5gDIbd/Y7N
 s7oIAAhtWS3WOk8M7ZQ+38iLbmtTnw2HSLPHogecw5ilJV/JOrUO+XdodczvXuzCzWg4DjR
 qMxzz/bZxIJkQ2lc/nkJqBM3hKM/IDBiTbLUMO2FBpLNjIRSoJXzTMqc9BVmmLaYLC4LZtI
 3c+XJ1W+InBhI5UUcYDPg==
UI-OutboundReport: notjunk:1;M01:P0:5MzyQ8MbDmk=;oMOnD1bnPESEhYRSX+M5hE+lVRT
 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
 kQaHpnJyQHg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_060653_003235_B1DAF4F0 
X-CRM114-Status: UNSURE (   4.61  )
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

=E2=80=A6
> This patch converts =E2=80=A6

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16#n94

Regards,
Markus

