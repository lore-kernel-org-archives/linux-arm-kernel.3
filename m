Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CA0CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tinAgCKBJ6C9VdHB3KI0GOJJKJagJfvxcuSFCa59zjU=; b=H4XjmFG4Ylz2cZqqPN8310Zfz+
	Aju58Yaj6zStojuXxJyiva6lK6oT86YEnh9pw2p7z34Sl+AIGCn3yWLvf0UGeA7OvPvNFA/bNiLak
	j8qKEOJXr7WB5Fx8570a5Vf+vq1u5ZH9LVQiKzIscRXrJKkFLeH6wFjv9DX5zFKtf+xT/NM2tl0Rh
	f4hNIidtNrVYE1ijF5mE8eDM1rm/UoQrxMDJ+pXeRb/ggsgonLRdEEXCOCNsFzjDHoutG8H5R2sFu
	ctskYVejg02Mnv+a0k7Tjr6YIn+e0ZTF9Dk7GJdfsRaI3pB7bsuNjXT/KGu8kRztiOkvl1GlNLCp7
	ITqAhc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2Uy-00000006Jxo-1jqV;
	Tue, 09 Jun 2026 19:52:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2Ux-00000006Jwv-0s3Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 19:52:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E6596024D;
	Tue,  9 Jun 2026 19:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26F91F00893;
	Tue,  9 Jun 2026 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781034750;
	bh=tinAgCKBJ6C9VdHB3KI0GOJJKJagJfvxcuSFCa59zjU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Jfc1Cw15UXaPGXMHbyqnLDGEdorsJvHXsyJznXPC7w3DNBh+AQITCTLLUQy+Fw2me
	 eL76llUHL5l9/unbPYvQvNguAbB89fSkmm3ps59bHzVkmPeUxQZ4i+hsoFX8zhPYFz
	 mqt+E+cwkB9QmdcwJLtEFDRSu1GCmuPf9KyUviGYE7vrUOZjTAMuSACXstLuflR45m
	 oKMlC86Z9/Dg0ilHf+sM0vhdplhzMarvvcLPqLK0661QjNXc2DPf4DL9aWZv1gkkqX
	 jivlWW+wp75ygEpTVDlmUjkgCcY4iiLNZArt7+s9PtPwOR0ykAKnSrNUvnudSdvyve
	 yzuxKtPofmq6w==
Message-ID: <280b67e5-4b01-449a-928d-06c3843ad01f@kernel.org>
Date: Tue, 9 Jun 2026 21:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] can: flexcan: add NXP S32N79 SoC support
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Andra-Teodora Ilie <andra.ilie@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Haibo Chen <haibo.chen@nxp.com>
References: <20260609142954.1807421-1-ciprianmarian.costea@oss.nxp.com>
 <20260609142954.1807421-7-ciprianmarian.costea@oss.nxp.com>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20260609142954.1807421-7-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 09/06/2026 at 16:29, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add device data and compatible string for NXP S32N79 SoC.
> 
> FlexCAN IP integration on S32N79 SoC uses two interrupts:
> - one for mailboxes 0-127
> - one for signaling bus errors and device state changes
> 
> Co-developed-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
> Signed-off-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Reviewed-and-tested-by: Haibo Chen <haibo.chen@nxp.com>
> Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

Reviewed-by: Vincent Mailhol <mailhol@kernel.org>


Yours sincerely,
Vincent Mailhol


