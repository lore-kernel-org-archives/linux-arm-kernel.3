Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8603BC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 21:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUnzwvptOByim/ucOYr6TfZ9ss3/DQ7PxM0faURq4oo=; b=Db9ihE3ODatkzmnZMKM0Q0BOim
	4JCfVAsDdP26aiH1FNWeLbE0yDeaCKFwrXwKmY6qZYj5D+gxBi7zhOCq5LnOruT0Twm3/cS/E3+/y
	DNdCh4KySj4ZJshRFC38vpecLEGd6XE6fvNNWPFAZtNwi7l4qXGoltfxrMDxFZc5ekVJIEBwId7SN
	sPqAizQX/BQ9USoQfG7kNFDsVOH27O9JpwyIpoJ3q378TleZiXY2GH2IJ0BsDQtdD3keyPnvWBM09
	ya3y4ovjTyFfw5x435JTnztG8EY1DmqAS9fNpFbkgYEVGx/a+HwUUDN58OjSrJEzLjp9o3ORv+lqX
	fwWYhzyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgbQ-00000005xmF-2iJw;
	Sun, 04 May 2025 21:10:24 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgYd-00000005xUC-0f5q;
	Sun, 04 May 2025 21:07:32 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-224171d6826so55091715ad.3;
        Sun, 04 May 2025 14:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746392850; x=1746997650; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUnzwvptOByim/ucOYr6TfZ9ss3/DQ7PxM0faURq4oo=;
        b=PTIM1YtPXKtQg4V3bbWwErfzgnoMhq7R8UpnvfsGpa/nIukvYp2HVVRP1280mgWx51
         +qiaRBOLpn40rLm9lkpQx1olVVKyGE8PEN4POPfoM/SVLoaXyDJx39sp+2v4cYUb1DYX
         S+Cg1LgSlt6MY/q2Jvg/PwcGtDVkAVPs73noUX183J0Pocxhg2mHWR/2hkxGriZcZqO+
         tSZQ5aFGF1NBRMo1fx3Oy/Ljx+nFB7+fb5gMcLQFVA+bmpmrhf12GD0X51II8g6Ca9L+
         53yUkJYMhV7he2XhkU7yOR2qAaCDH5Rd7JXa4VfGy/327vYyCuMuxl6B5/H/GuUZpDAN
         TxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392850; x=1746997650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUnzwvptOByim/ucOYr6TfZ9ss3/DQ7PxM0faURq4oo=;
        b=uXxry202REDnUd8aVPE4Qb7qlC95ONHAaLXi/yr1SoDSu+tDt846MP1PJYWeLPz16W
         yHCJTolv7DrJdqp4OkSUUzAo1CEFTFbHb6wpRcsG/AlxyezsUrhPcLkMjBPWTH+gnrPI
         /TJlikZrKgDIgU6HdJ8E+SPuPGhnJzDOjqORTAvDbZGa2HZ3Nt4UjtGkNJGKIENW3HQE
         jENrS0Ps5YG/jsKkJJ3roa9EC/dUiWoRfn1rx7aJuA38eZ+/GF38cRfB66UQ5YwUqPCI
         PHI6DwzYcMFNzzaTeV9k/FW4BRedOxZR9pPIqV5ZXVqc6vjU1+5DXV6ZphPlgIddUv5J
         41Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUFm413PFWGjRIhbc+p+M9/OHuRMXIildpvvCLwMqs0ODMBGeQ334q9/Mno4je8ZVUGLximpfO7l5v9nwnXQfqK9Q==@lists.infradead.org, AJvYcCVyiouuzVveIcd17NG1UGXPlEtdQr83+YiV0rAHzNoseTuN9Hhf/f36kwyJyQjMaqL3lVDwN32XegoS/q5y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5z2y5pbxNdHc0d+COUWWdN8X6QOEPJ/rQYM67PTEH10M1ZOow
	NoZOtmcbQwL9/MDtxfJMXHG2FrVC1av/iOVRs+xMe24X4/Oqny+jPvmNMGQ+8JKjVj8/PMunRyr
	PmSyMgXFtp7Lcxh6FuFWgXHBgXVE=
X-Gm-Gg: ASbGncvZPq7U5qnl9oPnx5LMImYAaJxbwqJsk5idhjdtRRqflV49THz5GqmFkTPiEbB
	UrQT0WCi/YDOZKU3yElaZ8JVtZjzoSXLYVYxmo8jnXtUwd9vUslip1p5OjUgVGgwy7mTu6ewHGO
	Zxhmf8EC4RYPD7mQ+/IqiXPIq26u0LlL1OdYEoaLBICKUJasJzjAbpkJU=
X-Google-Smtp-Source: AGHT+IE4yCRULV8L0X001s3hseepDxE2pMX59fNpwmKQdirlnzPxqBjXHGsiaArFgHU3ITvCieH+XPwI6UqVlx0sRJ4=
X-Received: by 2002:a17:903:11c8:b0:223:f9a4:3fb6 with SMTP id
 d9443c01a7336-22e1e8c3ee0mr62089055ad.11.1746392850175; Sun, 04 May 2025
 14:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250503084443.3704866-1-christianshewitt@gmail.com>
In-Reply-To: <20250503084443.3704866-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:07:18 +0200
X-Gm-Features: ATxdqUG9_zNauUndvpj8bS3vMeW4x8DGoy38X_LVK07lpYOYelvTZu9YHJNhxnA
Message-ID: <CAFBinCCcGk9dRUp8yj740OMcgcck2iWe_cN-J0jOt5M74+zBgA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: dreambox: fix missing clkc_audio node
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Emanuel Strobel <emanuel.strobel@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_140731_197254_ADF59A9F 
X-CRM114-Status: UNSURE (   8.12  )
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

On Sat, May 3, 2025 at 10:44=E2=80=AFAM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Add the clkc_audio node to fix audio support on Dreambox One/Two.
>
> Fixes: 83a6f4c62cb1 ("arm64: dts: meson: add initial support for Dreambox=
 One/Two")
> CC: <stable@vger.kernel.org>
> Suggested-by: Emanuel Strobel <emanuel.strobel@yahoo.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

