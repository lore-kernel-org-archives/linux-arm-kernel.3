Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048A7C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8cDJ4lSmHlxSHHsrsR6Ku6y7KJbcpSf5mf6dGPdv9A=; b=jYogiFpsxt1qEP8Rra9JhV/WKR
	CFy1gOt8MqR90k2m3SfPgLLq2lXN3VX6DpIt6mkF932c76BQ1KfeRXAAxVU5Y7QeQT82xkMItsqGV
	M8HtWOFyJGfimpq1LmgCaPk9lKvDLKTC7n+Y6l0bSSGI7K1+ATF0HOmfD3Ygt2GnW0sgLPdHxRkKs
	lToQzZNxk/fFIrmG9oYp7Aq5g5P0VDnHv44OnKm7U49nSSNi/eSr5glBmAMz1/GPNLnRBV+fzOp2e
	ukydyRqBZj5ndMs8TVfIUWC1XHtO2S6xaAKvzyH4qCJlV78248JjOHpLxJAwQd8sREZIhXxlNIYnQ
	avXfw9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thl9A-00000002uDN-3cjj;
	Tue, 11 Feb 2025 07:57:32 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thl7i-00000002tt5-078j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 07:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739260557; x=1739865357; i=markus.elfring@web.de;
	bh=b8cDJ4lSmHlxSHHsrsR6Ku6y7KJbcpSf5mf6dGPdv9A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=R2NSUzlOENGGd9tSVqZOlw+RF+S1ervuJIcdhRRkzK0Dd1dX9iIMYaeu6AzTtT2e
	 NSQBJqdyukDNTUwO3xXLCCoDI6IeGRjQ4cFkQDKJSXcObw0MuGD9K4IZWCpFd5peh
	 13Q8F1oBNRrfyQJE2O8wZRVmVXnOB6FtNK2RhJDK7Z3AC6HYKc1pgPO5Kt8bWNW/R
	 rrEhF4NXWp0NPEqk0rHiXvYt9xfsMMpbYapvZ9wsMH/r17rs73Tg3AF9nEoBA/iPe
	 xYcnAy+nmtG5Iuj3pDd2RJrB/lhBQ2p8Z96drI3F3YLZjOJLVfRuKGX3A5Eo4G5uJ
	 JZDN5C62ZuoCmlmAaA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.9]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MFrxr-1tbUw639Xr-004dft; Tue, 11
 Feb 2025 08:55:57 +0100
Message-ID: <03681acf-9524-4fd1-b40d-a7cafe1c5572@web.de>
Date: Tue, 11 Feb 2025 08:55:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] drm: xlnx: zynqmp_dpsub: Add NULL checks in
 zynqmp_audio_init()
To: Charles Han <hanchunchao@inspur.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Vishal Sagar <vishal.sagar@amd.com>
References: <20250211032830.2400-1-hanchunchao@inspur.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250211032830.2400-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:USnYnQXWxocGuM37zSToa8h9T0sJugExpCOPAS5wXImCLuqUR6f
 kLJhstS1kXuTCHVqA3fJIsdplst6DMALOOKqjeFeId2Q7VTrWPzFqE++bKGc5BqxsbyXXIq
 B1aXysi6VQyK5yFFob6D7zUp2GpHjotI5kYKrDsDYg8HHYcbhfk3KO31letLzoYY7gTVrQ5
 cFeUQobbXq0eaMDYDXPig==
UI-OutboundReport: notjunk:1;M01:P0:xKVS0rHKMsY=;RT9f9ib+CuKUU0bTTT0xk/moXNt
 XuBhhKM25BotD4SkvCeaUmZHS5aCNq5p1PkdeiODx3Ivn4/5zxoWqlfIdG3sZy7B91X9u9uOe
 Pj4hBfDuG0krWTSgrmkkJSo9faHdtSSSYWZRbTbnhz0QmXHty+Aa6uhR1Te1mFYhnA4hsYdyw
 PHbkjIV5kUElluQjhwismap1f1XTNdx8CPMqLl+OGfjSD3GpeLQ+i1Sw3bfSK/F7qRcYS67ym
 AnmPrHy+Z4F1I3jkpJrcW3lh2+wLzAO8qDm4Onx/3X0TyiGNB+oougeItKB9qEbh0R7yf/YD7
 +PK5PjAHcvRsjtGEOAB355UnxxguF9sXY4WH8mF1Dt4qkLJ8I1UHWDlCXjAp0lmQQL4U+2h15
 K2sPhCogeDxM66Dghq4Uyft8qES9SOdTVotzqdXAdsIf+yKg2U8PEiobSzlAEgJQt9L00giJC
 s9UgJVO+VVrmioKbYMKlUMUwRGhrVuHlWlT5F/WUnSnqDVSemETdIuDI5Czo01CXEpVyzRUCy
 DEMipsp1zpiextHARBaxkEGmtxgjB61+CEtA/GBGavFGvHmr5xetaU9mApP2TMBcLPSzIU+Zn
 1DyzGEzy5cyY4FPB3Q0q69PnFyGIbh1bD0kkc09cDec9pzijTBtMBNJFNxYxITRxei+l9DPKd
 3AWteFMwnUZk3kQwSTuKEFjiSH5iAxRGB3nQ0a41ZbVvnrWKF65lJ68IR5oS7npJp+SEsO5Zn
 RKBXXexZqIlKnB1o7xAoJU0G/khcYwxSc3+7RBH/5mTkOrby1lf8AXuBUB1ho4xXMR/SrhLjb
 8sIS1mWxWvOp8TJ+vpUMJT9QoH9T7g+I23RVInMVJSUCICkYoK5i2yURnyCFg6HuVwqvhdLfv
 si4bbTHj4UHRQDurNA8co72WIWy1CRVzUfuTuKwtdyMf68dHlxnfJDNP9PQO1L+fnM13wq14W
 ovOAanmQZ9NsfezU9MQ6kbMkXiX6EgQa8PcBqTAg7TQJKJ4AUD3D4ueJHwSBgfzDpxVlpCwN1
 NJNBi69Tt4PaHGfSS9GzmpGJ8HeNpJ9mr/TSlGsVxh6ZJlccHVzUu33bqIvrYN6kCbO297E9t
 jnAXTUPXyPEYfxml2XcQd5Wow93ivStQaqlnTdN00mNh3kAVjcerOTSa1/n3+eXzfbIYaa/gl
 SVSmfMWPZnzVgh2TEtiBFSLdfF150CiGIsD6U6pMK1+KysxHQ1Wo/b8Kmp9bvuZbN4AXQnHOl
 jQAL/vFL1wjQTW4KFDlNnARwMGduVJZ51zFzCaWMr4FqatRs5ojVxDt3iN/HulA3MQJ8ARKAg
 OMQWlPSRhuRAk888eCnIETknM/lbg7U62jgptRoYDicRd0ZmnWWDrZnhcILbk5FX+7xROyBf6
 G7WdxvdCPpFD7bW9SjDIu0LNocvVxpPlqs084XR1cUcA0uqD1cAoI6FCP5BeftxbOvb6v8CJf
 2jn9rug==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_235602_449083_F6600CB4 
X-CRM114-Status: UNSURE (   5.52  )
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
> Add NULL check in zynqmp_audio_init(), to handle kernel NULL
> pointer dereference error.

* Can it be more desirable to prevent such issues?

* Would the message subject have been nicer with a key word like =E2=80=9C=
PATCH=E2=80=9D
  (besides other refinements)?


=E2=80=A6
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 4 ++++
=E2=80=A6

Will you become more familiar with patch version descriptions?
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc2#n310

Regards,
Markus

