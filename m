Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E072BE6B26F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 03:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pd2hd9AEX+WskWeDqJXxKCyLLtKBcx0KAJIPRnzr5Xo=; b=TAedTTMVOPl7zMGllgmWuTrV0J
	j1Mluy67ZauONHD5/9yUqe67YUnPIcpbCOoHgewkwJzF/vMrvezBxEASELuuiPuD2NxjJm0TH3Mtm
	RgAvUgx8C4Kr2mE3yjsb/Ly6SRoskC2B6cdWSR7fH+jf9SgxAvOzE84Yel40lLSgIih5gqZ52TykC
	q9baiQwbDrpNOXaPLDriw4dHbu+nkQ4v5SP7l9Y+LNIbX1cmlJ65SbX5ocKEHBrWWHePk72vDTkCr
	udZp8GEKCr+0O6gWxx8BwKG4xECPQEjq66M7GqRU0XlRXMjNAg+IS70mPSmGBczITpLUXgDS2SF3+
	R6aNa0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXsvv-0000000ESwE-0QfU;
	Tue, 23 Dec 2025 03:19:35 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXsvr-0000000ESvW-33Ei
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 03:19:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-598f81d090cso4946626e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 19:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766459968; x=1767064768; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pd2hd9AEX+WskWeDqJXxKCyLLtKBcx0KAJIPRnzr5Xo=;
        b=A9IC+vEhyOfYMqdG6UMXFm/tzReo+zRwY6b9JFYSmBwyQogqJMNYVXC0Sr9Pj1EJ+6
         lZVqpIQtkLFNCkpEt/h+pB0H9XTnvATpz6z3n0Zmv3R7KLwEqCyfjhcPYMzfh60jp4+e
         uHn9NuGPxh0aBNmzlM/rsm8U/flWb+Pfrgxh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766459968; x=1767064768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pd2hd9AEX+WskWeDqJXxKCyLLtKBcx0KAJIPRnzr5Xo=;
        b=Afm3gBd3IXQ+79KwwnvNR8qCi0nPjVFehplHTAL/tsRkU4exBYCc7P4mW2iac/xa0z
         NrZNQPAHP3rGLyKmCnJnpJjhn3UmjXvkxkZeTSdntxAPMSRlKEKQtNB78AbcrbnpRSaZ
         qLE32yIkL9GsHsahhcqZGEejj1TkU5hxghUuMmd2fPLdQrUuRKJ2JHcOoAQa42FjbqaL
         /HtT+onurQqkCXzLgmYmPLhFpLcwVle76PN96vvkHW+lTypJPpk4dfnFHSWgYy5iLssk
         ufPV9wyNr+zPTi1N/8De6B6o7SxwXyrvYvleRp4HBOlFPTcy3zDqWlXtfAoLFgT2pTAI
         lt3g==
X-Forwarded-Encrypted: i=1; AJvYcCXvEVujsv5e8FrnVOu1hwhtLRNAWMFOIMhcCfitQpf4tPQXVZGL9Cj0SD0MlQtAJi2P2jVVOjhRj3nQtreQHbj5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6Q/h9DCeOBuem9b6qLvqqXqwe/6wAxPwweGf1oDOTi4wB8ADr
	qI+nK//s9zGI3FmwMymXIwENb9bUzVfuBDyPlAws3r60BldN8zjB0jy3ovH/TxKLbT6ZPeQXJ4b
	aMNvwsz/WXgeG2R3M6wtNgD3WMr/ddBqDdGZcoaYO
X-Gm-Gg: AY/fxX63i+pPxvx0tjh+nFQEM5DKZZ/ze8NLLfw+oQx6WMTVTFbbmvV+ExlVxAe3s7K
	gzqIYj5IJLYOJVkK1bUrk4yAf6HkLjv6EBj4XqeWmbbXm5ekAsdcVziJmyTk/xqpDbsS4Ah8kBp
	nAMbMtceJJC61wfl3tQWM5dJVX9BwuJmCl/2VSvQhqo+hnDgiVt5yTBnVx6nhXwE09fVx7XtS0G
	o3/KNMSOjVUJgk3KpENjm4JL0GNP+0rFoL1dOFWL1DZBWEy06DwwNSI5ybH0ZoL/2MmgdIt2w==
X-Google-Smtp-Source: AGHT+IFy9AOL0XZAW314iBU7PN1wAQk22EnHMu31kd1tAVh11JfXOyXoRocWK3NJXq6iWOnv76XMMgmNoj26Q+851TM=
X-Received: by 2002:a05:6512:4011:b0:592:f72f:c1d8 with SMTP id
 2adb3069b0e04-59a17d0ceffmr4689655e87.16.1766459967809; Mon, 22 Dec 2025
 19:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 23 Dec 2025 11:19:16 +0800
X-Gm-Features: AQt7F2oIhxgGHerdzbiWe8ZSd5-OTgGfh7cSzAPDbvOiCtJ4ezQNimNvcoit_0Q
Message-ID: <CAGXv+5Gpf+U8ih_QvZmEwSQgkb2c0wesLNePCG=eDqy0G7F-vA@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: don't select clk-mt8192 for all ARM64 builds
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_191932_070416_8F6044DB 
X-CRM114-Status: UNSURE (   9.36  )
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

On Mon, Dec 22, 2025 at 11:02=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> This option defaults to y for ARCH64 meaning it's built even if we don't
> want anything related to mediatek. Make the default condition stricter
> and only build it if ARCH_MEDIATEK is selected.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

