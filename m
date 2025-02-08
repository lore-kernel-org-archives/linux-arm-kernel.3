Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F33C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 15:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7smLfTFL5BKYAZQkazi7scNRCK0L6bFwsDahCQSasH4=; b=q6eWPRqMXfvj2rp2uFEgaNV0xZ
	9ZAHLhuqLXiXljFAZ+5rZkWJTkuw9m0vTLazHRQ6c6fsbkmlUfsxsGdzYtEU30BMNSDL4mVkOrTSC
	BhApXZbksNhD1JjtjOIcPMnAbnkvhkbOtRK6zQuKr8UVL32A0nmZqi3CMc+BUZQwo4jCV3zTvtWed
	TWXFBok6yaUnVrl1CMhOsKvbVXti19PM22bglBI5N1G3/u1+/aZvOD00lD555y8cTqZfRD0h5naIe
	UsAsv/VMXDuR8ClDqfn+hNXTZtDuS5UoAnJwj49fhsi0+daty544gWGFQQiPufTrL2LHy1wI7+wLD
	q+ZXYxAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgmpA-0000000D8md-2MPz;
	Sat, 08 Feb 2025 15:32:52 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgmnk-0000000D8fb-2j8r
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 15:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739028668; x=1739633468; i=markus.elfring@web.de;
	bh=7smLfTFL5BKYAZQkazi7scNRCK0L6bFwsDahCQSasH4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OTJYcSmQXnJ28ne+zJmF6sLLBOptrLx32EOeU3FkEeHE/fASP5Eox2XGtb7+ncld
	 yQSdqQOgj6SstGmXeXNKCCdcUfhnTxqb8IO4bigyzGKGJp0VaU7JOcCXVOKDQzt6g
	 1dlBhC+zk6V3a+bVfvQyNRSqYEtwLMVoL8bBBrMnqZBr8QYseV/bhicAbvOGCpQ8d
	 MDcTGiBtJjEqSk2Uk4AsQb8mQNO+BHJTs/nAeZwRVCMMh4qCr6c2RnQrPOXgEKSi1
	 bOq2iXySPtsuAskQ2tJLbD3P36vJoJhblc/tSnrHw+iJwt5xeNsj6vV8L7RqNlcRu
	 SBy/6spmRo0tjdoX+Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.11]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLRUX-1txUjf1q67-00TWna; Sat, 08
 Feb 2025 16:31:08 +0100
Message-ID: <e1fffd3b-d3dd-4f46-b7b6-1f03f934dd30@web.de>
Date: Sat, 8 Feb 2025 16:31:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tudor Ambarus <tudor.ambarus@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Will McVicker <willmcvicker@google.com>
References: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
Subject: Re: [PATCH v7 2/3] firmware: add Exynos ACPM protocol driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:41VPE8YHUwhgvBJ+GjhA+69xcvqt1/dXMka1JYXhGwdWO2uxU0+
 7/tUEhDlca6pJpreqOxT0yc/2G/pKFSQk8NqsO5zPkOwc4nOZXKtDDL69ehUZu0GpAS81OU
 39aVyHgvoCaT4xVlWeAtznFQTeDWQTehi/JwsFJUoLHGcrnkRVilv49G07dM7mLxhlhmWIF
 +3qOlG8VmFmL3NQOo14qA==
UI-OutboundReport: notjunk:1;M01:P0:+Z9MQ63j70M=;uZzfcpFuhUOZtbmhzft5U8Jbey4
 oW3o5TdOkWPhufzVXoEqHrHgOXYQ8NpDuKZb4xpCXgiS6Qyo4AuvUCgTe7BZbVu4WAi4N/JH0
 zGr+STweUFR1vfLD1QhQHFMITyWEwOVUpgMFVTXMpaMQ64mbr4vm8s8izDP6pzSCR1O5NhQwV
 AK4b8btFxk9umsrQ0/npcAH/y5gTeSMUm8Xg27MhXrMR2JoJ7Bg98sYuF+lXU/Lg8Dn4WbmQu
 9kv5wBwWDa2VuDvPr5VtqWvIQGmyUBrqeNbwQeRmfk4jVYhpFpWeOhiuE5C0bzxPbEL8eJbj6
 8xzl/LwSeSNqDltqHg3ypRCSYCEOHKKSj8Q/Im3KE7QIaw5+tx4J+bg4PexXvv45pEuVKKrCp
 +tGvJj0oJt90uCAyZEmLe4b18AeMBj9swUVTNGccuhLRpZyvX2LGZroc0TxPjSER5c5ekYjxP
 LtNsMmEPP9312NhQc2Hc+VpErdKURktZ5ExFWlkFoSFKXjTcfNgsWFBqcE7C3sXQtyFskYrKq
 Bs6Jcu8NJWrZuu6qefCMkXMHrUgbEg+lyLGNg7v9/zUnZJPftE97bC3CQYqH81R2GAc9FzE4/
 bY1q0TAat7MiBJIL0MMv1/4fvXM69Lkh34TmaDPzNemx39PpiNGeCF6id+bD0s6ua7TAGUeOR
 84nDWnnhRap3ZD06RhIQQALB5bgkWA675BjFZrPR0kZl4pxtJcbTrCC4zfbMCeVOTwH/cqxZd
 C0ebnUnggHraL7/ayhiDebCZhmAc5MdWs63W4amaTV54WRUyHM6p8GfLzaw/8FxtZjvS0SQLR
 d2g6drU5YREC0PJnlfvSgB8Onne5cnINZFr4t7TKqPSzZ3YHjICz3qb9JT5MXPRrkJzBRfyYu
 psXOvWzMkXFHGz/SNa5J6f76smmSwDOlruZOrIopD+AENAAfbpmHSvh5zqNQtmTDUfseI2KWa
 3zNCPBdwsawfyxNXPk2a755BNZZjzrvEsLye9EXdllqhVJtQCY2CLgd24foxFwyWDumZ6UYM2
 ieLaAmbfHVwAiNTWJC8Gq/RmbBFM9qnmhRkoXYbaeg5gU5xJqKmsEPPsUesXyXMacp2m2PZ4b
 ab8mzmhmaYTxDjzw5nTlg6spCC16Kq8l+NR6LRZsBZrA6VdW5z1jMR1BYpjnqCgriMIKuvNdP
 J5lL8/sjouxpw4+2eOIHUXjxAoee+6DKC1A9BYNCRuwuFDPkE5VbJuS9QPZQ62TXJBS3Pyxsk
 WZ5PPQxbgGDHfzh7p0tNbIHclpu/M/suXyG8m3MrnGPodUSHHT8XP+88JbDVilxTAv9ek1Ws6
 wJ6sua0IP8dbmq/ZnnyihOJuA71AB0fDvrxJou7h4spXl5S1R55LV9BJYK+B8OxU+EeRifYXV
 Xggs3O4ztBhwqsWXygWmLH90ptIRKVbmYQTkZZhyDkA9BVwIinOHhs75tosNloZrGp55rp87A
 NZmER3mT0QMIGakfNHiH4dgDRVHI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_073125_079826_1C54AD8D 
X-CRM114-Status: UNSURE (   5.73  )
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
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -0,0 +1,771 @@
=E2=80=A6
> +static int acpm_dequeue_by_polling(struct acpm_chan *achan,
> +				   const struct acpm_xfer *xfer)
> +{
=E2=80=A6
> +	do {
> +		mutex_lock(&achan->rx_lock);
> +		ret =3D acpm_get_rx(achan, xfer);
> +		mutex_unlock(&achan->rx_lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&achan->rx_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.13.1/source/include/linux/mutex.h#L201

Regards,
Markus

