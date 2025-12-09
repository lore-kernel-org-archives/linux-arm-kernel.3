Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2B3D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 12:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVfvPAVJiKDUO/oAofy3yqLD+wUWwuI5iU1iNTYY+WI=; b=TUEuQPS4lB68zU9h8rgEsTLxkZ
	qO/fBYOkQpbgRDbRr5YNFMXSrAz0cRrWBT/3xCv9E8pOEcw+MfMjbAmjW728puFB6/J6iU1xe7zeX
	wHocmpXa4JP5hpRWJjDcgIS7j6aesIPdHeceTJTKC2oIx+qh5MraB88GJXA4TtpuZNq4sIsP3oUCY
	DdAtywgIDm6es0jPxW69+RNlzHWCmYEBCjQ+tdob1sNlPNQDXQzK5/Y/6kvoa/SVvzk+PhqRxTZBy
	t2XTBRtzRx/EsEf90JUlXUQE4yu/4ieB0lrF8B/QypiauqWQL7mthVSyvzaBoz+CRtK//HzdYH24A
	XAC+sNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwub-0000000EGAG-1QXG;
	Tue, 09 Dec 2025 12:33:49 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwuZ-0000000EG9v-2q6t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 12:33:48 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2981f9ce15cso74671855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 04:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765283626; x=1765888426; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVfvPAVJiKDUO/oAofy3yqLD+wUWwuI5iU1iNTYY+WI=;
        b=KIh8S+pDW5T/JUNsUblZUhJzrQ/onIKr733/tUgEJ8Td9PfyKWHa7JiGDzQc11L7an
         CQM8r358DhXzftsoyLBQEiNxsSKiR00LPoFPppNQ3qYUQBNKys+ZulAbWTlrh1QcMEfp
         asYowoeUgkdidbjdS7xnUcJouN8S8YPcmsgIPxPZ+blBd4lo4E57V2kSy1f4g+BtO9Lm
         a3yIFbvL7YOOfkW7t0OkSbKiBy0/7V/F4/LKQvlyfoyXwFjHeNao5M+byXhkR4KLgxCa
         KbrSPFWrToj5d/zXtFAy2tdzzdSuC/JfAZksvBLbnz1f29ViSplQVCQsN5iZHceGvmZF
         XeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283626; x=1765888426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bVfvPAVJiKDUO/oAofy3yqLD+wUWwuI5iU1iNTYY+WI=;
        b=orttnh+zw1u1hvv4dCJPWvhBtvp+VKiSdaJQ2Kjc/sYdMEFrCKCwve1NGpw/PzD7l+
         wjG7E0vILiEEXcZs7E4VbVYQtDQxqG5wet4llvLS+dODKfVaQ8DNCEbUQgQLUzCBH1Zv
         UaUblQgUWPl/JYhiV7qwHI6dGzclA8O3Z6AT4sQl98XLgMYB4tzdDLUOrl3D6HXMm5ub
         e2naKNqmK+XXHPnsJ/cATzUrd6BB+XNCEOlMJuTtIlzdgqjQPYzf0X9u39dB3M1mJskQ
         TX465iqQToIWibeswsLCoDlxYHOsUmaJLf03py3k8dRtmdEh/7maqfU2nZrL+Xwe/zUQ
         qBew==
X-Forwarded-Encrypted: i=1; AJvYcCUllzNHKGPPYqSLaB6aDI7qJqmusqPnokwFoFVswVuuFFRYvDzj5hnVerm2/bXRkUlqpgoKuct9pVRb7Xe60qXg@lists.infradead.org
X-Gm-Message-State: AOJu0YxXks4j5/8JcFPtTzmKY6C5eMV68buWhEyDTZx0N5rTsk9I/lnZ
	qjWV1kQ7JNtBmgZCt4Z1KLBwwqBT27qIgiwaVoy/IdrXNgwLNRvpFgGWPhLa9lXd3Hahk7GuGsO
	mn2VgdFfIvZxqHYEMxCF9tM+MOCfoUbI=
X-Gm-Gg: ASbGncuZd9OEs3/fi//NhLCZB+/forYnp698jH7oViPdNIFqPS1zs+K54Z6X639ynSf
	4fsWRdiUEpa+WnwB4YF/Op9hm9PtvqlS4+C1zFPeKcaGjLXFstWR6iiCjLY128/M4bo5LJOCsoG
	eIDC6fJpIDMWwuwtXuqPKQBD5TVAJkb93akdKxxpLwt5hyyS0k6df3xU8UycILV9O6g0k4f9oM5
	cV7zRxdWylAH6o3hfkly1RFlwYO1xpRWfw4t+PeE9lO6eReUfg17/NkE9/hlBa8rl2VxAAte1tb
	fygJroUvh5dME7TSps1NeWpJw6V0Rxi/9Zgwmi9Klmti1vi6S0AEeRIgABUkT42IDLS8g8eO+C+
	X3w0Ca9cvbfqbvnTqgzzR
X-Google-Smtp-Source: AGHT+IG7a3swFOeoavHL3eVOxyU5R1CfS1RV/ynqUg2AU4818nOaE1Wsmd3U72SU9rWnp62z0sQPFfouzT4ajqcYuug=
X-Received: by 2002:a05:7023:b04:b0:11b:79f1:850 with SMTP id
 a92af1059eb24-11e0326a26cmr8705323c88.14.1765283626541; Tue, 09 Dec 2025
 04:33:46 -0800 (PST)
MIME-Version: 1.0
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 14:36:15 +0200
X-Gm-Features: AQt7F2r__yxV-yD2aXnM4sB7qPP_1HD4VqjjT-S7yknrdE9jP-LkBjBwD7RtsF0
Message-ID: <CAEnQRZB5_WngP+U0nVdW0dnopUD5YDtZEU91StywvNTQdNSPNA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table" check
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_043347_736127_AD256D11 
X-CRM114-Status: UNSURE (   8.37  )
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

On Tue, Dec 9, 2025 at 1:33=E2=80=AFAM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
>
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.
>
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Good catch.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

