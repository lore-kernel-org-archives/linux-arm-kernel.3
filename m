Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B834D25032
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CZe0kp3YvZifht9TF7J0pNQV6O4i3Xn8fgypmpyKvM=; b=REp0NW5HgyEiFZnbh6KGtGkdAN
	tUQYCt+/UJokDDziXsUcbK/Ay96ece5Gvfu7ft9QMYHao1sD3fkDNRg3eVslWClLipqp/q+KaebLi
	4mNBEuIsOONq16KhjVT8PYYe1EYCRT/3tgpcuoM4m+e0eeLqDgYpnCzqL5T/IhrFHJzBWv2EUb6gz
	qvhozocZIcxfROlox1pxajBECtOlv0C0yn7/TDSj1L9d2KWkYhy75ULvTbanTXdevVvabgUxELpn2
	BQuCR04vzXkHXgnl/+Sg2A9mQaDJ3MXEPqwvLKRf36qKQE70CNg4DECT0L7aSwWXVMb+7u4oShqEN
	Gl0WuknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCZH-00000004uqv-1otA;
	Mon, 12 Jan 2026 07:42:27 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCZF-00000004upn-2LJn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 07:42:26 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so5991107e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 23:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768203743; x=1768808543; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CZe0kp3YvZifht9TF7J0pNQV6O4i3Xn8fgypmpyKvM=;
        b=Y/TQn5b99u09pF0zcOiXxul01iiu1re3ehsCAl++iiaVt6ZzvaFJfIFKvFbkcc6OaY
         fIHtMW6teGC/zu9JwGAPpq4meJ4xfNxE1PZHcDGqc2QdV8OEbgFabw/zLaN7xWQijHDy
         HaE9kX/whJnpYBa40IvgLJfZlfLy2RU7k4PNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203743; x=1768808543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3CZe0kp3YvZifht9TF7J0pNQV6O4i3Xn8fgypmpyKvM=;
        b=Mhw//+IIUkTSCcRiMJJX3VCFtEd2WhI/XhLzpOZdNOgjmM7agB3yuALvI/1w7Fvk/P
         wrC0f2XxU9t/t72xDqHrWumsI4m1zF6GmIxkT/949YMPafh5P34pcuQWhv/YnbgEj91H
         rkUl5Icnf/m/CXPCOQa7qn45GYL5sPRg+W5dt6AEVBWYkIg51HJ8byN7kN8ePBAUaB7P
         n4ztCNklrj6lW4qPTLZV5Kk+VlKEdmUyh2+56sehzgMgNSnD4tV8Ahd4v1FFFHxDTtQm
         CR2Hl1RAaCm6IkuJTsh5SrqBSQ7nO3gCLfHUzjBmMxMOhlKYIXu3glvcVvBvdoAigneI
         Rh6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1eqADFwyxaIoqWtDzAPtNze6smLMRr+kra/5yUH9ufMAETFjc0jE8Zp+qzDm6bmEDq9lRQniFL6f12Hq5ob2V@lists.infradead.org
X-Gm-Message-State: AOJu0YzIHQho9a81aC7737zUHTbMXBYVPBoIPHG5ZLPyMPzSBiDeRgQa
	xhef3iJosq0EGy3wpOoD1MAyi9VR6+8cfLQrNZRzSya5mTx4I7JQW5YPbBKe2X/E3IFzyPQckSw
	L5g5mC2fkk7hO5Yo6lycQETVoLkxXD1JbeuJMCPLR
X-Gm-Gg: AY/fxX7P4roZHi0kklU0aGScRESrrg3ZMua2dexAPiSqv293LbME4XenlwJP8KDWgB4
	Zr3VCgzBi85rkr39YYhXn4vhDzf/6rJhiIj+rPNhd/ZpyK3yoaz1EV+VzpJYwLcneQK0HnwVMVe
	K25TUCSPBtvw6Cie3EhfkqioaZ1Xzy7zt63sg6mpsC20WPQMknYIH87WuomT6B+uoiaDQxBBnu4
	cjsrq5KBv1UUl96Gj4HTQUq5+zg2z1soRoKiMLP4acqZT0BAdM/DX3HP6NUXk9K0dxmIyyR3odA
	mp9y8XzML66AVkFLf/q5QWTz
X-Google-Smtp-Source: AGHT+IGVc0Z2JDRCQM5TMXXHmh/cYXBFfOa8+kLkLkYVFEmHdQa4U5SihlDMvs5L8T4nzdOAt8JPcoXc0kdii0T5lTQ=
X-Received: by 2002:a05:6512:238e:b0:59a:1819:277d with SMTP id
 2adb3069b0e04-59b6ef0285emr6512360e87.5.1768203743522; Sun, 11 Jan 2026
 23:42:23 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-11-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:42:12 +0800
X-Gm-Features: AZwV_Qi-sYgNZhY-tRMlNpjpDMDSuAUofyCpTvn8OEDgVdLKfkEI96a0JTlQ-uo
Message-ID: <CAGXv+5E=Ff6iJLNJg=_crWKmGWCk8sKpNCEtdEffF997JAnU9A@mail.gmail.com>
Subject: Re: [PATCH 10/11] arm64: dts: mediatek: mt8192-asurada: Remove unused clock-stretch-ns
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_234225_602826_AFB0645D 
X-CRM114-Status: UNSURE (   8.03  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Remove the clock-stretch-ns property from i2c2, as it has always
> been (and still is) unused.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

