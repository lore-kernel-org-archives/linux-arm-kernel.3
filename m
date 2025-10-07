Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15C0CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 09:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoMO66q26G+B2gccNgWDr71yV2I0BZ/WZu+Mh8rY2bk=; b=DlHJulHM0XlUl+1rxAq//cvDtn
	LzR+Rst9RaS7/dl98+oNbb+CE8tD7BdHD94v2fwClms6kBLcpdoYaBhnJj5woW2Ma0q2LXM9urvsg
	/9dD7rXADpgQmW1y2n/2M1G3zd18YClAy7iSnttxUXdAK7rYr/wVeAYAIHw+X/XqM30LvdmLX/UUT
	tXwgCzf+L0wEmsaidD3yCK+zCS7SRuu/59zYMutP8wQwCH4CfZelRxKhCO9WjJLIa5HRLiZgRhAZa
	ZzGdOdsoN/fVJPVIsuj+uxS93Mt+6sIJTOVyENqOpl4/S4BC/nP2Oqh0XHdlqm6hCy4b3fAZ6uCHR
	o1RF48Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63dJ-00000001fFY-0XMA;
	Tue, 07 Oct 2025 09:05:21 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63dF-00000001fF6-3iQV;
	Tue, 07 Oct 2025 09:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1759827912; bh=YCPXdnG5zQAocVXJ3TiIrBnpkKTBpqwF0eKVaj6G9aM=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=bH3h03gJn2Olv7O538Cv+ijkF+N4ZzLrxe9yoduUJCcd0s0Y6p9ALFEaiYfj+65hL
	 /JxpPE2biHy2FiKR8xH65AJKuZgQ92CyWpPPiO6dTW3UH3Lfyj6hMJDloe3/M3moz/
	 fZCZ1z14I8IYXdy/dsYZNZn1X3wWAFXoAysyMr6Q=
Date: Tue, 7 Oct 2025 11:05:11 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Leonardo G. Trombetta" <lgtrombetta@gmx.com>
Subject: Re: [PATCH v3 0/5] Upstreaming Pinephone Pro Patches
Message-ID: <6joes3gufls2bx37gf2uoywyahlqprn73qfz6gfico5jxkua7z@irixdgkqp66p>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Rudraksha Gupta <guptarud@gmail.com>, Dragan Simic <dsimic@manjaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Leonardo G. Trombetta" <lgtrombetta@gmx.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20250921-ppp_light_accel_mag_vol-down-v3-0-7af6651f77e4@gmail.com>
 <53eabe34a310ea9c74315fa09a604e4a@manjaro.org>
 <b01ed528-8b29-4a6a-bdff-88f2e3b5dd2e@gmail.com>
 <115da845d9161e6ecfa67cf189b84aa8@manjaro.org>
 <37f2603e-8c51-4f92-a7af-0e60cd577004@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37f2603e-8c51-4f92-a7af-0e60cd577004@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_020518_401142_7FB07F1A 
X-CRM114-Status: GOOD (  14.97  )
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

On Sat, Oct 04, 2025 at 09:55:19PM -0700, Rudraksha Gupta wrote:

> Awesome! I was hoping that others would comment on the testing I've done
> (especially for the accelerometer and magnetometer patches) as I can't tell
> if userspace is wrong or if my testing/conclusion is wrong. Mobile Linux is
> very early stages at the moment, and I suspect the Pinephone and Pinephone
> Pro were used as reference devices with Megi's downstream kernel. Wrong
> mount matrices in the downstream kernel might be affecting userspace. This
> means that with the corrected mount matrices in this patch series, userspace
> is slightly broken (eg. since I fixed the accelerometer, the screen in Phosh
> and KDE Plasma are upside down. I suspect KDE's Kompass and Leonardo's
> compass app might be the same if I'm changing the mount matrix for the
> magnetometer). This is why I decided to showcase the raw values in my
> testing. If my testing is incorrect, please feel free to let me know.
> 

KDE Kompass uses this as an algorithm: 

 https://invent.kde.org/smigaud/kompass/-/blob/master/src/compass.cpp?ref_type=heads

which is largely inadequate and doesn't take mount matrix (in_mount_matrix) into
account at all. So that's not a good reference app. Also it doesn't even
claim to support "af8133j" sensor.

Leonardo's compass app has its own mount matrices, when kernel doesn't contain
one:

https://gitlab.com/lgtrombetta/compass/-/blob/main/src/compass.py?ref_type=heads

which we can also use for comaprison/confusion and is different from what your
patches are trying to upstream. :)

regards,
	o.

